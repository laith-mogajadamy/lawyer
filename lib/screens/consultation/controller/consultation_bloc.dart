import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/enums.dart';
import 'package:lawyer/core/utils/prefrences.dart';
import 'package:http/http.dart' as http;
import 'package:lawyer/screens/consultation/data/consultation_request.dart';
import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';

part 'consultation_event.dart';
part 'consultation_state.dart';

class ConsultationBloc extends Bloc<ConsultationEvent, ConsultationState> {
  ConsultationBloc() : super(const ConsultationState()) {
    on<Addconsultation>((event, emit) async {
      print("Addconsultation");

      String? ptoken = Preferences.getToken();
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(
            token: ptoken, consultationState: RequestState.loading));
        print("state.token");
        print(state.token);
        http.Response response = await ConsultationRequest.addconsultation(
            state.token, event.id, event.title!, event.description!);
        var responsemap = await jsonDecode(response.body);
        print("responsemap=");
        print(responsemap);
        if (response.statusCode == 200) {
          emit(state.copyWith(
              consultationMessage: "consultation added successfully ",
              consultationState: RequestState.loaded));
          add(
            SendInvoice(
              invoiceId: event.invoiceid!,
              senderid: responsemap['sender']['id'].toString(),
              receiverid: event.receiverid!,
              consultationid: responsemap['id'].toString(),
              invoicevalue: event.invoicevalue!,
            ),
          );
        } else {
          emit(state.copyWith(
            consultationMessage: responsemap["message"],
            consultationState: RequestState.error,
          ));
        }
      } else {
        emit(state.copyWith(
          consultationMessage: "Unauthenticated",
          consultationState: RequestState.error,
        ));
      }
    });
    on<Answerconsultation>((event, emit) async {
      print("Answerconsultation");
      String? ptoken = Preferences.getToken();
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(
            token: ptoken, consultationState: RequestState.loading));
        print("state.token");
        print(state.token);
        http.Response response = await ConsultationRequest.answerconsultation(
            state.token, event.id, event.answer);
        var responsemap = await jsonDecode(response.body);
        print("responsemap=");
        print(responsemap);
        if (response.statusCode == 200) {
          emit(state.copyWith(
              consultationMessage: "consultation answered successfully ",
              consultationState: RequestState.loaded));
        } else {
          emit(state.copyWith(
            consultationMessage: responsemap["message"],
            consultationState: RequestState.error,
          ));
        }
      } else {
        emit(state.copyWith(
          consultationMessage: "Unauthenticated",
          consultationState: RequestState.error,
        ));
      }
    });
    on<SendInvoice>((event, emit) async {
      print("SendInvoice");
      print("event.senderid");
      print(event.senderid);
      print(state.invoicestate);

      String? ptoken = Preferences.getToken();
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(token: ptoken, invoicestate: RequestState.loading));
        print("state.token");
        print(state.token);
        http.Response response = await ConsultationRequest.sendinvoice(
          state.token,
          event.invoiceId,
          event.senderid,
          event.receiverid,
          event.consultationid,
          event.invoicevalue,
        );
        var responsemap = await jsonDecode(response.body);
        print("responsemap=");
        print(responsemap);
        print(response.statusCode);
        if (response.statusCode == 201) {
          emit(state.copyWith(
              invoiceMessage: "invoice paied successfully ",
              invoicestate: RequestState.loaded));
          print(state.invoicestate);
        } else {
          emit(state.copyWith(
            invoiceMessage: responsemap["message"],
            invoicestate: RequestState.error,
          ));
        }
      } else {
        emit(state.copyWith(
          consultationMessage: "Unauthenticated",
          consultationState: RequestState.error,
        ));
      }
    });
    //
    on<AddPaymentMethods>((event, emit) async {
      print("AddPaymentMethods");
      print("event.methods");
      print(event.methods);

      emit(
        state.copyWith(paymentmethods: event.methods),
      );
    });
    //
    on<StartPayment>((event, emit) async {
      print("StartPayment");
      print("event.id");
      print(event.paymentid);
      setUpActionBar() {
        print("setUpActionBar");
        MFSDK.setUpActionBar(
            toolBarTitle: 'BRIEFCASE Payment',
            toolBarTitleColor: '#FFEB3B',
            toolBarBackgroundColor: '#CA0404',
            isShowToolBar: false);
      }

      initiatePayment(String language) async {
        print("initiatePayment");

        MFInitiatePaymentRequest request = MFInitiatePaymentRequest(
            invoiceAmount: 100, currencyIso: MFCurrencyISO.UAE_AED);
        await MFSDK
            .initiatePayment(request,
                (language == "en") ? MFLanguage.ENGLISH : MFLanguage.ARABIC)
            .then(
              (value) => debugPrint(
                value.toString(),
              ),
            )
            .catchError((error) => {debugPrint(error.message)});
      }
// executePayment

// The value "1" is the paymentMethodId of KNET payment method.
// You should call the "initiatePayment" API to can get this id and the ids of all other payment methods
      executePayment() async {
        print("executePayment");

        MFExecutePaymentRequest request = MFExecutePaymentRequest(
            invoiceValue: 100, displayCurrencyIso: MFCurrencyISO.UAE_AED);
        request.paymentMethodId = 2;
        //  request.paymentMethodId;

        await MFSDK.executePayment(request, MFLanguage.ENGLISH, (invoiceId) {
          debugPrint(invoiceId);
        }).then((value) async {
          add(
            Addconsultation(
              id: event.receiverid!,
              title: event.title,
              description: event.description,
              invoiceid: value.invoiceId.toString(),
              receiverid: event.receiverid.toString(),
              invoicevalue: event.invoicevalue,
            ),
          );

          return debugPrint(
            value.toString(),
          );
        }).catchError((error) => {debugPrint(error.message)});
      }

      Future<void> startPayment(String language) async {
        //             "rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL",
        MFSDK.init(
            "rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL",
            MFCountry.UAE,
            MFEnvironment.TEST);
        // Use the following lines if you want to set up the properties of AppBar.
        setUpActionBar();
        // Initiate Payment
        await initiatePayment(language);
        await executePayment();
      }

      startPayment(event.language!);
      emit(
        state.copyWith(),
      );
    });
  }
}
