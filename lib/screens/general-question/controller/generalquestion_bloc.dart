import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lawyer/core/utils/enums.dart';
import 'package:lawyer/core/utils/prefrences.dart';
import 'package:lawyer/models/general-question.dart';
import 'package:http/http.dart' as http;
import 'package:lawyer/models/generalquestionmodel.dart';
import 'package:lawyer/screens/general-question/data/general-question-reqwest.dart';

part 'generalquestion_event.dart';
part 'generalquestion_state.dart';

class GeneralquestionBloc
    extends Bloc<GeneralquestionEvent, GeneralquestionState> {
  GeneralquestionBloc() : super(const GeneralquestionState()) {
    on<GetGeneralquestion>((event, emit) async {
      print("Getlawyers");
      String? ptoken = Preferences.getToken();
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(
          generalquestionsState: RequestState.loading,
          token: ptoken,
        ));
        print("state.token");
        print(state.token);
        http.Response response =
            await Generalquestionreqwest.getgeneralquestion(state.token);
        var responsemap = await jsonDecode(response.body);
        print("responsemap=");
        print(responsemap);
        if (response.statusCode == 200) {
          emit(state.copyWith(
            generalquestions: List<GeneralquestionModel>.from(
              (responsemap[0] as List).map(
                (e) => GeneralquestionModel.fromJson(e),
              ),
            ),
            generalquestionsState: RequestState.loaded,
          ));
          print("state.generalquestions=");
          print(state.generalquestions);
        } else {
          emit(state.copyWith(
            generalquestionsState: RequestState.error,
            generalquestionMessage: responsemap["message"],
          ));
        }
      } else {
        emit(state.copyWith(
          generalquestionsState: RequestState.error,
          generalquestionMessage: "Unauthenticated",
        ));
      }
    });
  }
}
