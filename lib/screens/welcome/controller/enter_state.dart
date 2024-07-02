part of 'enter_bloc.dart';

class EnterState extends Equatable {
  final String islogedin;
  final bool bottom;
  final bool registerbottom;

  final File? fimage;
  final File? feid;
  final File? beid;

  final List<File>? certifications;
  final List<File>? license;
  final List<String>? expertise;
  final bool available;
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
  final String phone;
  bool get isValidnumber => phone.length >= 10;

  final String gender;
  final String birth;
  final String country;
  final String city;
  final String location;

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
//
  final String yearsofpractice;
  final List<String> practices;
  final List<String>? languages;

  final List<Lawyer> contacts;

  const EnterState({
    // this.user = const User(
    //     token: "", email: "", name: "", number: "", type: "", password: ""),
    this.islogedin = '',
    this.bottom = false,
    this.registerbottom = false,
    this.fimage,
    this.feid,
    this.beid,
    this.certifications = const [],
    this.license = const [],
    this.expertise = const [],
    this.available = false,
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
    this.token = '',
    this.id = 0,
    this.email = '',
    this.password = '',
    this.retypePassword = '',
    this.name = '',
    this.phone = '',
    this.gender = '',
    this.birth = '',
    this.country = '',
    this.city = '',
    this.location = '',
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
    this.yearsofpractice = '',
    this.practices = const [],
    this.languages = const [],
    this.contacts = const [],
  });

  EnterState copyWith({
    String? islogedin,
    bool? bottom,
    bool? registerbottom,
    File? fimage,
    File? feid,
    File? beid,
    List<File>? certifications,
    List<File>? license,
    List<String>? expertise,
    bool? available,
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
    String? phone,
    String? gender,
    String? birth,
    String? country,
    String? city,
    String? location,
    String? eidnumber,
    String? dob,
    String? landline,
    String? occupation,
    String? consultationprice,
    String? biography,

    //
    String? destenation,
    String? type,
    String? message,
    FormSubmissionStatus? formStatus,
    List<Consultation>? consultations,
    List<Generalquestion>? generalquestions,
    //
    String? yearsofpractice,
    List<String>? practices,
    List<String>? languages,
    List<Lawyer>? contacts,
  }) {
    return EnterState(
      islogedin: islogedin ?? this.islogedin,
      bottom: bottom ?? this.bottom,
      registerbottom: registerbottom ?? this.registerbottom,
      fimage: fimage ?? this.fimage,
      feid: feid ?? this.feid,
      beid: beid ?? this.beid,

      certifications: certifications ?? this.certifications,
      license: license ?? this.license,
      expertise: expertise ?? this.expertise,
      available: available ?? this.available,

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
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      birth: birth ?? this.birth,
      country: country ?? this.country,
      city: city ?? this.city,
      location: location ?? this.location,

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
      //
      yearsofpractice: yearsofpractice ?? this.yearsofpractice,
      practices: practices ?? this.practices,
      languages: languages ?? this.languages,
      contacts: contacts ?? this.contacts,
    );
  }

  @override
  List<Object?> get props => [
        islogedin,
        bottom,
        registerbottom,
        fimage,
        feid,
        beid,
        certifications,
        license,
        expertise,
        available,
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
        phone,
        gender,
        birth,
        country,
        city,
        location,
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
        //
        yearsofpractice,
        practices,
        languages,
        contacts,
      ];
}
