import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:lawyer/core/utils/enums.dart';
import 'package:lawyer/core/utils/formstatus.dart';
import 'package:lawyer/core/utils/prefrences.dart';
import 'package:lawyer/models/lawyer.dart';
import 'package:lawyer/models/lawyermodel.dart';
import 'package:lawyer/screens/lawyers_and_translation_company/data/lawyerrqwest.dart';

part 'lawyers_event.dart';
part 'lawyers_state.dart';

class LawyersBloc extends Bloc<LawyersEvent, LawyersState> {
  LawyersBloc() : super(const LawyersState()) {
    on<Getlawyers>((event, emit) async {
      print("Getlawyers");
      String? ptoken = Preferences.getToken();
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(
          lawyersState: RequestState.loading,
          token: ptoken,
        ));
        print("state.token");
        print(state.token);
        http.Response response = await Lawyersreqwest.getlawyers(state.token);
        var responsemap = jsonDecode(response.body);
        print("responsemap=");
        print(responsemap);
        if (response.statusCode == 200) {
          emit(state.copyWith(
            lawyers: List<LawyerModel>.from(
              (responsemap['lawyers'] as List).map(
                (e) => LawyerModel.fromJson(e),
              ),
            ),
            lawyersState: RequestState.loaded,
            //
            translationCompanys: List<LawyerModel>.from(
              (responsemap['translationCompany'] as List).map(
                (e) => LawyerModel.fromJson(e),
              ),
            ),
            translationCompanysState: RequestState.loaded,
          ));
          print("state.lawyers=");
          print(state.lawyers);
          print("state.translationCompanys=");
          print(state.translationCompanys);
        } else {
          emit(state.copyWith(
            lawyersState: RequestState.error,
            lawyersMessage: responsemap["message"],
            translationCompanysState: RequestState.error,
            translationCompanysMessage: responsemap["message"],
          ));
        }
      } else {
        emit(state.copyWith(
          lawyersState: RequestState.error,
          lawyersMessage: "Unauthenticated",
          translationCompanysState: RequestState.error,
          translationCompanysMessage: "Unauthenticated",
        ));
      }
    });

    on<GetlegalConsultant>((event, emit) async {
      print("GetlegalConsultant");
      String? ptoken = Preferences.getToken();
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(
          lawyersState: RequestState.loading,
          token: ptoken,
        ));
        print("state.token");
        print(state.token);
        http.Response response = await Lawyersreqwest.getlawyers(state.token);
        var responsemap = jsonDecode(response.body);
        print("responsemap=");
        print(responsemap);
        if (response.statusCode == 200) {
          emit(state.copyWith(
            legalconsultant: List<LawyerModel>.from(
              (responsemap['legalConsultant'] as List).map(
                (e) => LawyerModel.fromJson(e),
              ),
            ),
            lawyersState: RequestState.loaded,
          ));
          print("state.legalconsultant=");
          print(state.legalconsultant);
        } else {
          emit(state.copyWith(
            lawyersState: RequestState.error,
            lawyersMessage: responsemap["message"],
          ));
        }
      } else {
        emit(state.copyWith(
          lawyersState: RequestState.error,
          lawyersMessage: "Unauthenticated",
        ));
      }
    });
    on<GettypingCenter>((event, emit) async {
      print("GettypingCenter");
      String? ptoken = Preferences.getToken();
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(
          lawyersState: RequestState.loading,
          token: ptoken,
        ));
        print("state.token");
        print(state.token);
        http.Response response = await Lawyersreqwest.getlawyers(state.token);
        var responsemap = jsonDecode(response.body);
        print("responsemap=");
        print(responsemap);
        if (response.statusCode == 200) {
          emit(state.copyWith(
            typingCenters: List<LawyerModel>.from(
              (responsemap['typingCenter'] as List).map(
                (e) => LawyerModel.fromJson(e),
              ),
            ),
            lawyersState: RequestState.loaded,
          ));
          print("state.typingCenters=");
          print(state.typingCenters);
        } else {
          emit(state.copyWith(
            lawyersState: RequestState.error,
            lawyersMessage: responsemap["message"],
          ));
        }
      } else {
        emit(state.copyWith(
          lawyersState: RequestState.error,
          lawyersMessage: "Unauthenticated",
        ));
      }
    });
    on<Selecteshow>((event, emit) async {
      emit(
        state.copyWith(
          selecte: event.selecte,
        ),
      );
    });
    on<CheckLawyer>((event, emit) async {
      List<Lawyer> slected = List.from(state.selectedlawyers);

      print("before");

      print(slected);
      print("after");

      if (event.check!) {
        slected.add(event.lawyer!);
      } else {
        slected.remove(event.lawyer);
      }
      emit(
        state.copyWith(
          selectedlawyers: slected,
        ),
      );
      print("slected");
      print(state.selectedlawyers);
    });
    on<CreateGroup>((event, emit) async {
      print("CreateGroup");
      String? ptoken = Preferences.getToken();
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(token: ptoken, creatgroupstate: FormSubmitting()));
        print("state.token");
        print(state.token);

        http.Response response = await Lawyersreqwest.creatgroup(
            state.token, event.name!, state.selectedlawyers);
        var responsemap = await jsonDecode(response.body);
        print("responsemap=");
        print(responsemap);
        if (response.statusCode == 200) {
          emit(state.copyWith(
              creatgroupMessage: "Group created successfully ",
              creatgroupstate: SubmissionSuccess()));
        } else {
          emit(state.copyWith(
            creatgroupstate: SubmissionFailed(responsemap["message"]),
            creatgroupMessage: responsemap["message"],
          ));
        }
      } else {
        emit(state.copyWith(
          creatgroupstate: SubmissionFailed("Unauthenticated"),
          creatgroupMessage: "Unauthenticated",
        ));
      }
    });
  }
}
