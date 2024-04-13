part of 'enter_bloc.dart';

class EnterState extends Equatable {
  final String islogedin;
  final bool bottom;
  final File? fimage;
  //didnt use it
  // final User user;
  //
  //
  final Lawyer user;
  final int id;
  final String token;
  final String image;
  final String name;
  bool get isValidName => email.length > 8;
  final String email;
  bool get isValidEmail => email.length > 10;
  final String password;
  bool get isValidPassword => password.length > 6;
  final String number;
  bool get isValidnumber => number.length >= 10;
  final String birth;
  final int gender;
  final String consultationPrice;
  final int location;
  final String type;
  final FormSubmissionStatus formStatus;
  final String message;
  final List<Consultation>? consultations;
  final List<Generalquestion>? generalquestions;

  const EnterState({
    // this.user = const User(
    //     token: "", email: "", name: "", number: "", type: "", password: ""),
    this.islogedin = '',
    this.bottom = false,
    this.fimage,
    //
    this.user = const Lawyer(
      id: 0,
      name: "",
      email: "",
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
    ),
    this.token = '',
    this.id = 0,
    this.email = '',
    this.image = '',
    this.password = '',
    this.name = '',
    this.number = '',
    this.birth = '',
    this.consultationPrice = '',
    this.gender = 0,
    this.location = 0,
    this.type = '',
    this.message = '',
    this.formStatus = const InitialFormStatus(),
    this.consultations = const [],
    this.generalquestions = const [],
  });

  EnterState copyWith({
    String? islogedin,
    bool? bottom,
    File? fimage,
    // User? user,
    //
    Lawyer? user,
    String? token,
    int? id,
    String? email,
    String? image,
    String? password,
    String? name,
    String? number,
    String? birth,
    int? gender,
    String? consultationPrice,
    int? location,
    String? type,
    String? message,
    FormSubmissionStatus? formStatus,
    List<Consultation>? consultations,
    List<Generalquestion>? generalquestions,
  }) {
    return EnterState(
      islogedin: islogedin ?? this.islogedin,
      bottom: bottom ?? this.bottom,
      fimage: fimage ?? this.fimage,
      user: user ?? this.user,
      token: token ?? this.token,
      id: id ?? this.id,
      email: email ?? this.email,
      image: image ?? this.image,
      password: password ?? this.password,
      name: name ?? this.name,
      number: number ?? this.number,
      birth: birth ?? this.birth,
      gender: gender ?? this.gender,
      consultationPrice: consultationPrice ?? this.consultationPrice,
      location: location ?? this.location,
      type: type ?? this.type,
      message: message ?? this.message,
      formStatus: formStatus ?? this.formStatus,
      consultations: consultations ?? this.consultations,
      generalquestions: generalquestions ?? this.generalquestions,
    );
  }

  @override
  List<Object?> get props => [
        islogedin,
        bottom,
        fimage,
        //
        user,
        token,
        id,
        email,
        password,
        name,
        number,
        birth,
        gender,
        type,
        consultationPrice,
        location,
        message,
        formStatus,
        consultations,
        generalquestions,
      ];
}
