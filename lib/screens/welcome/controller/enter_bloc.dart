import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lawyer/core/services/auth.dart';
import 'package:lawyer/core/utils/enums.dart';
import 'package:lawyer/core/utils/formstatus.dart';
import 'package:http/http.dart' as http;
import 'package:lawyer/core/utils/prefrences.dart';
import 'package:lawyer/models/usermodel.dart';

part 'enter_event.dart';
part 'enter_state.dart';

class EnterBloc extends Bloc<EnterEvent, EnterState> {
  EnterBloc() : super(const EnterState()) {
    on<Getuser>((event, emit) async {
      print("getuser");
      String? ptoken = Preferences.getToken();
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(
          formStatus: const InitialFormStatus(),
          token: ptoken,
        ));
        print("state.token");
        print(state.token);
        http.Response response = await Auth.getuser1(state.token);
        Map responsemap = await jsonDecode(response.body);
        print(responsemap);
        if (response.statusCode == 200) {
          emit(state.copyWith(
              formStatus: SubmissionSuccess(),
              name: responsemap["user"]["name"],
              email: responsemap["user"]["email"],
              number: responsemap["user"]["phone"],
              islogedin: "true"));
          print(state.name);
          print(state.email);
          print(state.number);
        } else {
          emit(state.copyWith(
            islogedin: "false",
          ));
        }
      } else {
        emit(state.copyWith(
          islogedin: "false",
        ));
      }
    });
    on<LoginEmailChanged>((event, emit) async {
      emit(state.copyWith(
        formStatus: const InitialFormStatus(),
        email: event.email,
      ));
    });
    on<LoginPasswordChanged>((event, emit) async {
      emit(state.copyWith(
        formStatus: const InitialFormStatus(),
        password: event.password,
      ));
    });
    on<LoginNameChanged>((event, emit) async {
      emit(state.copyWith(
        formStatus: const InitialFormStatus(),
        name: event.name,
      ));
    });
    on<LoginNumberChanged>((event, emit) async {
      emit(state.copyWith(
        formStatus: const InitialFormStatus(),
        number: event.number,
      ));
    });
    on<TypeChanged>((event, emit) async {
      emit(state.copyWith(
        formStatus: const InitialFormStatus(),
        type: event.type,
      ));
    });
    on<LoginSubmitted>((event, emit) async {
      emit(state.copyWith(
          formStatus: FormSubmitting(),
          email: state.email,
          password: state.password));
      http.Response response = await Auth.login(state.email, state.password);
      Map responsemap = await jsonDecode(response.body);
      print("message==${state.message}");
      print("*********");
      print(responsemap);
      print("statusCode==${response.statusCode}");
      print("*********");
      if (response.statusCode == 200) {
        emit(
          state.copyWith(
            name: responsemap["name"],
            number: responsemap["phone"],
            formStatus: SubmissionSuccess(),
            message: " log in successed",
          ),
        );
        Preferences.savetoken(responsemap["access_token"]);
        print("++++++++++++++");
        print("token:${responsemap["access_token"]}");
        print("++++++++++++++");
        print(state.formStatus);
      } else {
        emit(
          state.copyWith(
            formStatus: SubmissionFailed(state.message),
            message: "login failed",
          ),
        );
        print(state.formStatus);
      }
    });
    on<RegisterSubmitted>((event, emit) async {
      emit(state.copyWith(
          formStatus: const InitialFormStatus(),
          email: state.email,
          name: state.name,
          number: state.number,
          type: state.type,
          password: state.password));
      http.Response response = await Auth.register(state.name, state.email,
          state.password, state.password, state.type, state.number);
      Map responsemap = await jsonDecode(response.body);
      emit(state.copyWith(message: responsemap["message"]));
      print("message==${state.message}");
      print("*********");
      print(responsemap);
      print("statusCode==${response.statusCode}");
      print("*********");
      if (response.statusCode == 201) {
        emit(
          state.copyWith(
            formStatus: SubmissionSuccess(),
          ),
        );
        Preferences.savetoken(responsemap["accessToken"]);
        print("++++++++++++++");
        print("token:${responsemap["accessToken"]}");
        print("++++++++++++++");
        print(state.formStatus);
      } else {
        emit(
          state.copyWith(
            formStatus: SubmissionFailed(state.message),
          ),
        );
        print(state.formStatus);
      }
    });
  }
}
