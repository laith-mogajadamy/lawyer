// ignore_for_file: avoid_print
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
import 'package:lawyer/models/city.dart';
import 'package:lawyer/models/consultation.dart';
import 'package:lawyer/models/general_question.dart';
import 'package:lawyer/models/language.dart';
import 'package:lawyer/models/language_model.dart';
import 'package:lawyer/models/lawyer.dart';
import 'package:lawyer/models/lawyermodel.dart';
import 'package:lawyer/models/practice.dart';
import 'package:lawyer/models/practice_model.dart';
import 'package:lawyer/screens/chat/data/chatrequest.dart';
import 'package:lawyer/screens/search/data/searchrequest.dart';

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
      add(
        GetLanguageAndPractice(),
      );
      http.Response response = await Auth.login(useremail!, userpassword!);
      print(response);

      var responsemap = await jsonDecode(response.body);
      print(responsemap);
      if (response.statusCode == 200) {
        emit(
          state.copyWith(
            user: LawyerModel.fromJson(responsemap["user"]),
            contacts: List<LawyerModel>.from(
              ((responsemap['contacts'] ?? []) as List).map(
                (e) => LawyerModel.fromJson(e),
              ),
            ),
            password: userpassword,
            token: responsemap["access_token"],
            message: " log in successed",
            formStatus: SubmissionSuccess(),
            islogedin: "true",
          ),
        );
        Preferences.savetoken(responsemap["access_token"]);
        add(
          GetPusherToken(),
        );
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
    on<GetPusherToken>((event, emit) async {
      Response response =
          await GetPusherConfigrequest.getpusherconfig(state.token);
      print(response);

      String pushertoken =
          response.data['options']['auth']['headers']['Authorization'];
      print(response.statusCode);
      if (response.statusCode == 200) {
        emit(
          state.copyWith(
            pushertoken: pushertoken,
          ),
        );
      } else {}
    });
    //
    on<GetLanguageAndPractice>((event, emit) async {
      print("GetLanguageAndPractice");

      print("state.token");
      print(state.token);
      http.Response practiseresponse = await SearchFilterRequest.getpractice();
      var practiseresponsemap = jsonDecode(practiseresponse.body);
      print("practiseresponsemap=");
      print(practiseresponsemap);
      http.Response languageresponse = await SearchFilterRequest.getlanguage();
      var languageresponsemap = jsonDecode(languageresponse.body);
      //get the locations
      print("practiseresponsemap=");
      print(practiseresponsemap);
      print("languageresponsemap=");
      print(languageresponsemap);

      if (practiseresponse.statusCode == 200 &&
          languageresponse.statusCode == 200) {
        emit(state.copyWith(
          practices: List<PracticeModel>.from(
            (practiseresponsemap as List).map(
              (e) => PracticeModel.fromJson(e),
            ),
          ),
          languages: List<LanguageModel>.from(
            (languageresponsemap as List).map(
              (e) => LanguageModel.fromJson(e),
            ),
          ),
          // searchfiltersState: RequestState.loaded
        ));
        print("state.practices=");
        print(state.practices);
        print("state.languages=");
        print(state.languages);
      } else {
        print("error11");

        emit(state.copyWith(
            // searchfiltersState: RequestState.error,
            // searchfiltersMessage: practiseresponsemap["message"],
            ));
      }
    });
    //
    on<CheckLanguage>((event, emit) async {
      List<Language> slected = List.from(state.selectedlanguages);

      if (event.check!) {
        slected.add(event.slelected!);
      } else {
        slected.remove(event.slelected);
      }
      emit(
        state.copyWith(
          selectedlanguages: slected,
          // searchfield:
          //     (state.searchfield == "location") ? "Practice" : "location",
        ),
      );
      print("slected");
      print(state.selectedlanguages);
    });
    //
    on<CheckPractice>((event, emit) async {
      List<Practice> slected = List.from(state.selectedpractices);

      if (event.check!) {
        slected.add(event.slelected!);
      } else {
        slected.remove(event.slelected);
      }
      emit(
        state.copyWith(
          selectedpractices: slected,
          // searchfield:
          //     (state.searchfield == "location") ? "Practice" : "location",
        ),
      );
      print("slected");
      print(state.selectedpractices);
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
    on<LawyerProfiledit>((event, emit) async {
      print("Profiledit");
      print(state.token);
      emit(state.copyWith(editStatus: FormSubmitting()));
      Response response = await Uploadfile.lawyerprofileedit(
        state.user.id,
        state.token,
        event.fimage,
        event.name,
        event.email,
        event.password,
        event.passwordconfirmation,
        event.gender,
        event.number,
        event.birth,
        event.country,
        event.city,
        event.emiratesid,
        event.frontemiratesid,
        event.backemiratesid,
        event.landline,
        event.bio,
        event.yearsofpractice,
        event.location,
        event.consultationPrice,
        event.available! ? 1 : 0,
        event.certification,
        event.licenses,
        event.practices!,
        event.languages!,
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
    on<ClientProfiledit>((event, emit) async {
      print("Profiledit");
      print(state.token);
      emit(state.copyWith(editStatus: FormSubmitting()));
      Response response = await Uploadfile.clientprofileedit(
        state.user.id,
        state.token,
        event.fimage,
        event.name,
        event.email,
        event.password,
        event.passwordconfirmation,
        event.gender,
        event.number,
        event.birth,
        event.country,
        event.city,
        event.emiratesid,
        event.frontemiratesid,
        event.backemiratesid,
        event.occupation,
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
    //
    on<AddExpertise>((event, emit) async {
      print(" AddExpertise");
      List<String>? newexpertise;

      newexpertise = List.of(state.expertise!)..add(event.expertise!);

      emit(
        state.copyWith(expertise: newexpertise),
      );
      print("newexpertise=${state.expertise}");
    });
    //
    on<AddLanguage>((event, emit) async {
      // print(" AddLanguage");
      // List<String>? newlanguage;

      // newlanguage = List.of(state.languages!)..add(event.language!);

      // emit(
      //   state.copyWith(languages: newlanguage),
      // );
      print("newlanguage=${state.languages}");
    });
    //
    on<Bottomshow>((event, emit) async {
      emit(
        state.copyWith(
          bottom: event.bottom,
          destenation: event.destenation,
        ),
      );
    });
    //
    on<RegisterBottomshow>((event, emit) async {
      print(" RegisterBottomshow${event.bottom}");

      emit(
        state.copyWith(
          registerbottom: event.bottom,
        ),
      );
    });
    //
    on<CheckAvailable>((event, emit) async {
      print(" CheckAvailable");

      emit(
        state.copyWith(available: event.available),
      );
      print("available=${state.available}");
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
        phone: event.number,
      ));
    });
    on<GenderChanged>((event, emit) async {
      emit(state.copyWith(
        formStatus: const InitialFormStatus(),
        selectedgender: event.gender,
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
        selectedcoutry: event.country,
      ));
    });
    on<CityChanged>((event, emit) async {
      emit(state.copyWith(
        selectedcity: event.city,
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
    on<YearsOfPracticeChanged>((event, emit) async {
      emit(state.copyWith(
        formStatus: const InitialFormStatus(),
        yearsofpractice: event.yearsofpractice,
      ));
    });
    on<BiographyChanged>((event, emit) async {
      print(" BiographyChanged");

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
    //
    on<LoginSubmitted>((event, emit) async {
      emit(state.copyWith(
          formStatus: FormSubmitting(),
          email: state.email,
          password: state.password));
      add(
        GetLanguageAndPractice(),
      );
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
        print("user consultations:${state.user.consultationsReceiver}");
        print("user generalquestions:${state.user.generalquestions}");
        Preferences.saveemail(state.email);
        Preferences.savepassword(state.password);
        Preferences.savetoken(responsemap["access_token"]);
        print("++++++++++++++");
        print("token:${responsemap["access_token"]}");
        print("++++++++++++++");
        print(state.formStatus);
        add(
          GetPusherToken(),
        );
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
    on<ClientRegisterSubmitted>((event, emit) async {
      emit(state.copyWith(
        formStatus: FormSubmitting(),
      ));
      Response response = await Auth.clientregister(
        state.type,
        state.name,
        state.email,
        state.password,
        state.retypePassword,
        state.selectedgender.id.toString(),
        state.phone,
        state.birth,
        state.selectedcoutry.id.toString(),
        state.selectedcity.id.toString(),
        state.eidnumber,
        state.feid,
        state.beid,
        state.occupation,
      );
      print("message==${state.message}");
      print("*********");
      print("statusCode==${response.statusCode}");
      print("*********");
      if (response.statusCode == 201) {
        add(
          LoginSubmitted(),
        );
        Preferences.savetoken(response.data["accessToken"]);
        Preferences.saveemail(state.email);
        Preferences.savepassword(state.password);
        print("++++++++++++++");
        print("token:${response.data["accessToken"]}");
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
    //
    on<LawyerRegisterSubmitted>((event, emit) async {
      emit(state.copyWith(
        formStatus: FormSubmitting(),
      ));
      Response response = await Auth.lawyerregister(
        event.type!,
        state.name,
        state.email,
        state.password,
        state.retypePassword,
        state.selectedgender.id.toString(),
        state.phone,
        state.birth,
        state.selectedcoutry.id.toString(),
        state.selectedcity.id.toString(),
        state.eidnumber,
        state.feid,
        state.beid,
        state.landline,
        state.consultationprice,
        state.biography,
        state.selectedcoutry.name.toString(),
        state.yearsofpractice,
        (state.available) ? "1" : "0",
        state.certifications,
        state.license,
        //check if its practise or expertise
        state.selectedpractices,
        state.selectedlanguages,
      );
      print("message==${state.message}");
      print("*********");
      print("statusCode==${response.statusCode}");
      print("*********");
      if (response.statusCode == 201) {
        add(
          LoginSubmitted(),
        );
        Preferences.savetoken(response.data["accessToken"]);
        Preferences.saveemail(state.email);
        Preferences.savepassword(state.password);
        print("++++++++++++++");
        print("token:${response.data["accessToken"]}");
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
                email: "",
                birth: "",
                gender: 0,
                phone: "",
                consultationPrice: 0,
                isactive: 0,
                role: 0,
                country: "",
                city: "",
                emiratesId: 0,
                frontEmiratesId: "",
                backEmiratesId: "",
                occupation: "",
                yearsOfPractice: "",
                numOfConsultation: 0,
                closedConsultation: 0,
                profile: "",
                certification: [],
                practices: [],
                languages: [],
                consultationsReceiver: [],
                consultationsSender: [],
                generalquestions: [],
                senderMessage: [],
                receiverMessage: [],
                unreadNotifications: [],
                groups: [],
                generalChats: [],
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
