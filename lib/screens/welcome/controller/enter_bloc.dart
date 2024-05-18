import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:lawyer/core/services/auth.dart';
import 'package:lawyer/core/services/uploadfile.dart';
import 'package:lawyer/core/utils/formstatus.dart';
import 'package:http/http.dart' as http;
import 'package:lawyer/core/utils/prefrences.dart';
import 'package:lawyer/models/consultation.dart';
import 'package:lawyer/models/general_question.dart';
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
      print(response);

      var responsemap = await jsonDecode(response.body);
      print(responsemap);
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
        print("userid:${state.user.id}");
        print("senderMessage:${state.user.senderMessage}");
        print("receiverMessage:${state.user.receiverMessage}");

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

      print(state.islogedin);
    });
    //
    on<LanguageChanged>((event, emit) async {
      emit(
        state.copyWith(
          language: event.language,
        ),
      );
    });
    //
    on<Profiledit>((event, emit) async {
      print("Profiledit");
      print(state.token);
      emit(state.copyWith(editStatus: FormSubmitting()));
      Response response = await Uploadfile.profileedit(
        state.user.id,
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
      print("data=${response.data}");

      // Map<String, dynamic> responsemap = await jsonDecode(response.data);
      if (response.statusCode == 200) {
        emit(
          state.copyWith(
            user: LawyerModel.fromJson(response.data),
            message: " profile edit successed",
            editStatus: SubmissionSuccess(),
          ),
        );
        print("state.message${state.message}");

        print("state.user${state.user}");
      } else {
        emit(
          state.copyWith(
            message: " profile edit failed",
            editStatus: SubmissionFailed(state.message),
          ),
        );
      }
    });
    //
    on<ImageChange>((event, emit) async {
      print(" ImageChange");
      print(" destenation${state.destenation}");

      if (state.destenation == "profileImage") {
        emit(
          state.copyWith(fimage: event.fimage),
        );
        print("image=${state.fimage!.path}");
      }
      if (state.destenation == "fronteid") {
        emit(
          state.copyWith(feid: event.fimage),
        );
        print("fronteid=${state.feid!.path}");
      }
      if (state.destenation == "backeid") {
        emit(
          state.copyWith(beid: event.fimage),
        );
        print("backeid=${state.beid!.path}");
      }
      if (state.destenation == "Certifications") {
        final newcertifications = List.of(state.certifications!)
          ..add(event.fimage!);
        emit(
          state.copyWith(certifications: newcertifications),
        );
        print("Certifications=${state.certifications}");
      }
      if (state.destenation == "license") {
        final newcertifications = List.of(state.license!)..add(event.fimage!);
        emit(
          state.copyWith(license: newcertifications),
        );
        print("license=${state.license}");
      }
    });
    on<AddCertification>((event, emit) async {
      print(" AddCertification");
      List<File>? newcertifications;
      for (var i = 0; i < event.certifications!.length; i++) {
        newcertifications = List.of(state.certifications!)
          ..add(event.certifications![i]);
      }
      emit(
        state.copyWith(certifications: newcertifications),
      );
      print("Certifications=${state.certifications}");
    });
    on<Bottomshow>((event, emit) async {
      emit(
        state.copyWith(
          bottom: event.bottom,
          destenation: event.destenation,
        ),
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
    on<LoginReTypePasswordChanged>((event, emit) async {
      emit(state.copyWith(
        formStatus: const InitialFormStatus(),
        retypePassword: event.retypePassword,
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
    on<GenderChanged>((event, emit) async {
      emit(state.copyWith(
        formStatus: const InitialFormStatus(),
        gender: event.gender,
      ));
    });
    on<BirthChanged>((event, emit) async {
      emit(state.copyWith(
        formStatus: const InitialFormStatus(),
        birth: event.birth,
      ));
    });
    on<CountryChanged>((event, emit) async {
      emit(state.copyWith(
        formStatus: const InitialFormStatus(),
        country: event.country,
      ));
    });
    on<CityChanged>((event, emit) async {
      emit(state.copyWith(
        formStatus: const InitialFormStatus(),
        city: event.city,
      ));
    });
    on<EidNumberChanged>((event, emit) async {
      emit(state.copyWith(
        formStatus: const InitialFormStatus(),
        eidnumber: event.eidnumber,
      ));
    });
    on<DobChanged>((event, emit) async {
      emit(state.copyWith(
        formStatus: const InitialFormStatus(),
        dob: event.dob,
      ));
    });
    on<LandLineChanged>((event, emit) async {
      emit(state.copyWith(
        formStatus: const InitialFormStatus(),
        landline: event.landline,
      ));
    });
    on<OccupationChanged>((event, emit) async {
      emit(state.copyWith(
        formStatus: const InitialFormStatus(),
        occupation: event.occupation,
      ));
    });
    on<ConsultationPriceChanged>((event, emit) async {
      emit(state.copyWith(
        formStatus: const InitialFormStatus(),
        consultationprice: event.consultationprice,
      ));
    });
    on<BiographyChanged>((event, emit) async {
      emit(state.copyWith(
        formStatus: const InitialFormStatus(),
        biography: event.biography,
      ));
    });
    //
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
        add(
          LoginSubmitted(),
        );
        // emit(
        //   state.copyWith(
        //     email: state.email,
        //     password: state.password,
        //     message: " log in successed",
        //     formStatus: SubmissionSuccess(),
        //     islogedin: "true",
        //   ),
        // );
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
      emit(
        state.copyWith(
          logoutStatus: FormSubmitting(),
        ),
      );
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
                generalquestions: [],
                senderMessage: [],
                receiverMessage: [],
              ),
              type: '',
              logoutStatus: SubmissionSuccess(),
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
              logoutStatus: SubmissionFailed(state.message),
              islogedin: "false"),
        );
        print(state.logoutStatus);
      }
    });
  }
}
