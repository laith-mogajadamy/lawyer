import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lawyer/core/services/auth.dart';
import 'package:lawyer/core/services/uploadfile.dart';
import 'package:lawyer/core/utils/formstatus.dart';
import 'package:http/http.dart' as http;
import 'package:lawyer/core/utils/prefrences.dart';
import 'package:lawyer/models/consultation.dart';
import 'package:lawyer/models/consultationmodel.dart';
import 'package:lawyer/models/general_question.dart';
import 'package:lawyer/models/generalquestionmodel.dart';
import 'package:lawyer/models/lawyer.dart';
import 'package:lawyer/models/lawyermodel.dart';

part 'enter_event.dart';
part 'enter_state.dart';

class EnterBloc extends Bloc<EnterEvent, EnterState> {
  EnterBloc() : super(const EnterState()) {
    on<Getuser>((event, emit) async {
      print("getuser");
      String? useremail = Preferences.getemail();
      String? userpassword = Preferences.getpassword();
      print("-------------------");
      print(useremail);
      print(userpassword);
      print("-------------------");
      emit(state.copyWith(
        formStatus: FormSubmitting(),
      ));
      http.Response response = await Auth.login(useremail!, userpassword!);
      Map responsemap = await jsonDecode(response.body);

      if (response.statusCode == 200) {
        emit(
          state.copyWith(
            user: LawyerModel.fromJson(responsemap["user"]),
            password: userpassword,
            token: responsemap["access_token"],
            message: " log in successed",
            formStatus: SubmissionSuccess(),
            islogedin: "true",
          ),
        );
        Preferences.savetoken(responsemap["access_token"]);
        print("token:${responsemap["access_token"]}");
        print("user:${state.user}");
        print("user consultations:${state.user.consultations}");
        print("user generalquestions:${state.user.generalquestions}");
      } else {
        emit(
          state.copyWith(
              formStatus: SubmissionFailed(state.message),
              message: "login failed",
              islogedin: "false"),
        );
      }
    });
    //
    on<Profiledit>((event, emit) async {
      print("Profiledit");

      emit(state.copyWith(
        formStatus: FormSubmitting(),
      ));
      Response response = await Uploadfile.profileedit(
        state.id,
        state.token,
        event.name,
        event.email,
        event.number,
        event.birth,
        event.location,
        event.gender,
        event.consultationPrice,
        event.fimage,
        event.certification,
      );
      print(response.statusCode);
      print(response);

      // http.Response response = await Auth.profileedit(

      // );
      // Map responsemap = await jsonDecode(response.body);
      // print(responsemap);
      // if (response.statusCode == 200) {
      //   emit(
      //     state.copyWith(
      //       // name: responsemap["user"]["name"],
      //       // id: responsemap["user"]["id"],
      //       // number: responsemap["user"]["phone"],
      //       // image: responsemap["user"]["image"],
      //       // email: responsemap["user"]["email"],
      //       // birth: responsemap["user"]["birth"],
      //       // consultationPrice: responsemap["user"]["consultationPrice"],
      //       // gender: responsemap["user"]["gender"],
      //       // location: responsemap["user"]["location"],
      //       message: " profile edit successed",
      //       formStatus: SubmissionSuccess(),
      //     ),
      //   );
      // } else {
      //   emit(
      //     state.copyWith(
      //       formStatus: SubmissionFailed(state.message),
      //       message: " profile edit failed",
      //     ),
      //   );
      // }
    });
    //
    on<ImageChange>((event, emit) async {
      print(" ImageChange");

      emit(
        state.copyWith(fimage: event.fimage),
      );
      print("image=${state.fimage!.path}");
    });
    on<Bottomshow>((event, emit) async {
      print("show bottom");
      emit(
        state.copyWith(bottom: event.bottom),
      );
    });
    //
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
            user: LawyerModel.fromJson(responsemap["user"]),
            password: state.password,
            token: responsemap["access_token"],
            message: " log in successed",
            formStatus: SubmissionSuccess(),
            islogedin: "true",
          ),
        );
        Preferences.savetoken(responsemap["access_token"]);
        print("token:${responsemap["access_token"]}");
        print("user:${state.user}");
        print("user consultations:${state.user.consultations}");
        print("user generalquestions:${state.user.generalquestions}");
        Preferences.saveemail(state.email);
        Preferences.savepassword(state.password);
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
              islogedin: "false"),
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
            name: responsemap["user"]["name"],
            id: responsemap["user"]["id"],
            number: responsemap["user"]["phone"],
            image: responsemap["user"]["image"],
            email: state.email,
            birth: responsemap["user"]["birth"],
            consultationPrice: responsemap["user"]["consultationPrice"],
            gender: responsemap["user"]["gender"],
            location: responsemap["user"]["location"],
            password: state.password,
            token: responsemap["access_token"],
            consultations: List<ConsultationsModel>.from(
              (responsemap["user"]["consultations"] as List).map(
                (e) => ConsultationsModel.fromJson(e),
              ),
            ),
            generalquestions: List<GeneralquestionModel>.from(
              (responsemap["user"]["generalQuestions"] as List).map(
                (e) => GeneralquestionModel.fromJson(e),
              ),
            ),
            message: " log in successed",
            formStatus: SubmissionSuccess(),
            islogedin: "true",
          ),
        );
        Preferences.savetoken(responsemap["accessToken"]);
        Preferences.saveemail(state.email);
        Preferences.savepassword(state.password);
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

    on<Logout>((event, emit) async {
      http.Response response = await Auth.logout(state.token);
      Map responsemap = await jsonDecode(response.body);
      print("message==${state.message}");
      print("*********");
      print(responsemap);
      print("statusCode==${response.statusCode}");
      print("*********");
      if (response.statusCode == 200) {
        Preferences.clear();
        emit(
          state.copyWith(
              user: const Lawyer(
                  id: 0,
                  name: "",
                  email: '',
                  birth: "",
                  gender: 0,
                  phone: "",
                  consultationPrice: 0,
                  isactive: 0,
                  location: 0,
                  yearsOfPractice: "",
                  numOfConsultation: 0,
                  closedConsultation: 0,
                  image: "",
                  certification: [],
                  practices: [],
                  consultations: [],
                  generalquestions: []),
              formStatus: SubmissionSuccess(),
              message: responsemap["message"],
              email: "",
              password: "",
              token: "",
              islogedin: "false"),
        );
      } else {
        emit(
          state.copyWith(
              message: responsemap["message"],
              formStatus: SubmissionFailed(state.message),
              islogedin: "false"),
        );
        print(state.formStatus);
      }
    });
  }
}
