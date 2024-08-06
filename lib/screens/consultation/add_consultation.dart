import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/core/utils/enums.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/models/lawyer.dart';
import 'package:lawyer/screens/consultation/controller/consultation_bloc.dart';
import 'package:lawyer/screens/widgets/black18text.dart';
import 'package:lawyer/screens/widgets/consultation_decription_input.dart';
import 'package:lawyer/screens/widgets/consultation_title_input.dart';
import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';

class AddConsultation extends StatelessWidget {
  final Lawyer lawyer;

  AddConsultation({super.key, required this.lawyer});

  TextEditingController title = TextEditingController();

  TextEditingController description = TextEditingController();

  final ConsultationBloc consultationBloc = ConsultationBloc();

  int paymentid = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => ConsultationBloc(),
      child: BlocConsumer<ConsultationBloc, ConsultationState>(
        listener: (context, state) {
          if (state.invoicestate == RequestState.loaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 2),
                content: Text(
                  state.invoiceMessage,
                  style: TextStyle(fontSize: 14.sp, color: Colors.white),
                ),
              ),
            );
          } else if (state.invoicestate == RequestState.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 2),
                content: Text(
                  state.invoiceMessage,
                  style: TextStyle(fontSize: 14.sp, color: Colors.white),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Center(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      S.of(context).Consultations,
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Black18text(text: lawyer.name),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      width: size.width,
                      child: ConsultationTitleInput(title: title),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      width: size.width,
                      child:
                          ConsultationDecriptionInput(description: description),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      width: size.width,
                      child: Text(
                        textAlign: TextAlign.center,
                        S
                            .of(context)
                            .THEDETAILANSWERWILLCOSTBASEDONTHELAWPRACTITIONERSRATEORSETPRICEOFTHISCONSULTAION,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColor.apporange,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColor.apporange,
                          decorationThickness: 3.h,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: size.height / 15,
                      width: size.width / 2.5,
                      child: BlocBuilder<ConsultationBloc, ConsultationState>(
                        builder: (context, state) {
                          return ElevatedButton(
                            onPressed: () {
                              Locale currentLocale =
                                  Localizations.localeOf(context);
                              print(currentLocale.languageCode);
                              startPayment(currentLocale.languageCode, context);
                              // context.read<ConsultationBloc>().add(
                              //       StartPayment(
                              //         language: currentLocale.languageCode,
                              //         title: title.text,
                              //         description: description.text,
                              //         invoicevalue:
                              //             widget.lawyer.consultationPrice,
                              //         receiverid: widget.lawyer.id,
                              //         paymentid: paymentid,
                              //         senderid: 0,
                              //       ),
                              //     );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              shape: StadiumBorder(
                                side: BorderSide(
                                    color: Colors.black, width: 1.5.w),
                              ),
                            ),
                            child: Text(
                              S.of(context).paysend,
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      width: size.width,
                      child: Text(
                        textAlign: TextAlign.center,
                        S
                            .of(context)
                            .IFNOTANSWEREDIN48HOURSYOURMONEYWILLBESENTBACKTOYOURACCOUNT,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColor.apporange,
                          fontWeight: FontWeight.w900,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColor.apporange,
                          decorationThickness: 3.h,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
            ),
          );
        },
      ),
    );
  }

  Future<void> startPayment(String language, BuildContext cntext) async {
    //             "rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL",
    MFSDK.init(
        "rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL",
        MFCountry.UAE,
        MFEnvironment.TEST);
    // Use the following lines if you want to set up the properties of AppBar.
    // Initiate Payment
    await initiatePayment(language, cntext);
    // await sendPayment();
    // await getPaymentStatus();
  }

//   setUpActionBar() {
  initiatePayment(String language, BuildContext ctext) async {
    print("initiatePayment");

    MFInitiatePaymentRequest request = MFInitiatePaymentRequest(
        invoiceAmount: 100, currencyIso: MFCurrencyISO.UAE_AED);
    await MFSDK
        .initiatePayment(request,
            (language == "en") ? MFLanguage.ENGLISH : MFLanguage.ARABIC)
        .then((value) {
      return showMyDialog(ctext, value);
    }).catchError((error) => {debugPrint(error.message)});
  }

// // executePayment
  executePayment(int id, BuildContext cntext) async {
    print("executePayment");

    MFExecutePaymentRequest request = MFExecutePaymentRequest(
        invoiceValue: 100, displayCurrencyIso: MFCurrencyISO.UAE_AED);
    request.paymentMethodId = id;
    //  request.paymentMethodId;

    await MFSDK.executePayment(request, MFLanguage.ENGLISH, (invoiceId) {
      debugPrint(invoiceId);
    }).then((value) {
      addConsultation(value.invoiceId!);
      if (value.invoiceStatus == "sucsses") {
        ScaffoldMessenger.of(cntext).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 3),
            content: Text(
              "payment sucssesed",
              style: TextStyle(fontSize: 14.sp, color: Colors.white),
            ),
          ),
        );
      }
      return debugPrint(
        value.toString(),
      );
    }).catchError((error) => {debugPrint(error.message)});
  }

  Future addConsultation(int invoiceId) async {
    print("invoiceId==========");
    print(invoiceId);
    consultationBloc.add(
      Addconsultation(
        id: lawyer.id,
        title: title.text.trim(),
        description: description.text.trim(),
        invoiceid: invoiceId.toString(),
        receiverid: lawyer.id.toString(),
        invoicevalue: lawyer.consultationPrice.toString(),
      ),
    );
  }

  void showMyDialog(BuildContext context, MFInitiatePaymentResponse value) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).selectPaymentMethod),
          content: SizedBox(
            height: 500.h,
            width: 200.w,
            child: ListView.builder(
                itemCount: value.paymentMethods!.length,
                itemBuilder: (ctext, index) {
                  return GestureDetector(
                    onTap: () {
                      paymentid = value.paymentMethods![index].paymentMethodId!;
                      executePayment(paymentid, ctext);
                    },
                    child: ListTile(
                      leading:
                          Image.network(value.paymentMethods![index].imageUrl!),
                      title: Black18text(
                          text: value.paymentMethods![index].paymentMethodEn!),
                    ),
                  );
                }),
          ),
          actions: [
            Center(
              child: TextButton(
                child: Black18text(text: S.of(context).Cancel),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

// sendPayment() async {
//   print("sendPayment");

//   MFSendPaymentRequest request = MFSendPaymentRequest();
//   request.customerName = "TEESST";
//   request.invoiceValue = 100;
//   request.notificationOption = MFNotificationOption.EMAIL;

//   await MFSDK
//       .sendPayment(request, MFLanguage.ENGLISH)
//       .then((value) => debugPrint(value.toString()))
//       .catchError((error) => {debugPrint(error.message)});
// }

// getPaymentStatus() async {
//   print("getPaymentStatus");

//   MFGetPaymentStatusRequest request =
//       MFGetPaymentStatusRequest(key: '2593740', keyType: MFKeyType.INVOICEID);
//   await MFSDK
//       .getPaymentStatus(request, MFLanguage.ENGLISH)
//       .then((value) => debugPrint(value.toString()))
//       .catchError((error) => {debugPrint(error.message)});
// }
