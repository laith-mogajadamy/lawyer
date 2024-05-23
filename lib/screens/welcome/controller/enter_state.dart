part of 'enter_bloc.dart';

class EnterState extends Equatable {
  final String islogedin;
  final bool bottom;
  final File? fimage;
  final File? feid;
  final File? beid;

  final List<File>? certifications;
  final List<File>? license;

  final FormSubmissionStatus editStatus;
  final FormSubmissionStatus logoutStatus;
  final String language;

  //
  final Lawyer user;
  final int id;
  final String token;
  final String name;
  bool get isValidName => email.length > 8;
  final String email;
  bool get isValidEmail => email.length > 10;
  final String password;
  final String retypePassword;
  bool get isValidPassword => password.length > 6;
  final String number;
  bool get isValidnumber => number.length >= 10;

  final String gender;
  final String birth;
  final String country;
  final String city;
  final String eidnumber;
  final String dob;
  final String landline;
  final String occupation;
  final String consultationprice;
  final String biography;

//
  final String destenation;

  final String type;
  final FormSubmissionStatus formStatus;
  final String message;

  const EnterState({
    // this.user = const User(
    //     token: "", email: "", name: "", number: "", type: "", password: ""),
    this.islogedin = '',
    this.bottom = false,
    this.fimage,
    this.feid,
    this.beid,
    this.certifications = const [],
    this.license = const [],
    this.editStatus = const InitialFormStatus(),
    this.logoutStatus = const InitialFormStatus(),
    this.language = 'en',

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
      senderMessage: [],
      receiverMessage: [],
      unreadNotifications: [],
      groups: [],
    ),
    this.token = '',
    this.id = 0,
    this.email = '',
    this.password = '',
    this.retypePassword = '',
    this.name = '',
    this.number = '',
    this.gender = '',
    this.birth = '',
    this.country = '',
    this.city = '',
    this.eidnumber = '',
    this.dob = '',
    this.landline = '',
    this.occupation = '',
    this.consultationprice = '',
    this.biography = '',

    //
    this.destenation = '',
    this.type = '',
    this.message = '',
    this.formStatus = const InitialFormStatus(),
  });

  EnterState copyWith({
    String? islogedin,
    bool? bottom,
    File? fimage,
    File? feid,
    File? beid,
    List<File>? certifications,
    List<File>? license,
    FormSubmissionStatus? editStatus,
    FormSubmissionStatus? logoutStatus,
    String? language,

    //
    Lawyer? user,
    String? token,
    int? id,
    String? email,
    String? image,
    String? password,
    String? retypePassword,
    String? name,
    String? number,
    String? gender,
    String? birth,
    String? country,
    String? city,
    String? eidnumber,
    String? dob,
    String? landline,
    String? occupation,
    String? consultationprice,
    String? biography,

    //
    String? destenation,
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
      feid: feid ?? this.feid,
      beid: beid ?? this.beid,

      certifications: certifications ?? this.certifications,
      license: license ?? this.license,

      editStatus: editStatus ?? this.editStatus,
      logoutStatus: logoutStatus ?? this.logoutStatus,
      language: language ?? this.language,

      //
      user: user ?? this.user,
      token: token ?? this.token,
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      retypePassword: retypePassword ?? this.retypePassword,
      name: name ?? this.name,
      number: number ?? this.number,
      gender: gender ?? this.gender,
      birth: birth ?? this.birth,
      country: country ?? this.country,
      city: city ?? this.city,
      eidnumber: eidnumber ?? this.eidnumber,
      dob: dob ?? this.dob,
      landline: landline ?? this.landline,
      occupation: occupation ?? this.occupation,
      consultationprice: consultationprice ?? this.consultationprice,
      biography: biography ?? this.biography,

      //

      destenation: destenation ?? this.destenation,

      type: type ?? this.type,
      message: message ?? this.message,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  @override
  List<Object?> get props => [
        islogedin,
        bottom,
        fimage,
        feid,
        beid,
        certifications,
        license,
        editStatus,
        logoutStatus,
        language,
        //
        user,
        token,
        id,
        email,
        password,
        retypePassword,
        name,
        number,
        gender,
        birth,
        country,
        city,
        eidnumber,
        dob,
        landline,
        occupation,
        consultationprice,
        biography,
        //

        destenation,
        type,

        message,
        formStatus,
      ];
}
