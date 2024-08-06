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
  final String pushertoken;

  final String name;
  bool get isValidName => email.length > 8;
  final String email;
  bool get isValidEmail => email.length > 10;
  final String password;
  final String retypePassword;
  bool get isValidPassword => password.length > 6;
  final String phone;
  bool get isValidnumber => phone.length >= 10;

  final City selectedgender;
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
  final List<Practice> practices;
  final List<Language> languages;
  final List<Practice> selectedpractices;
  final List<Language> selectedlanguages;
  final List<City> uaecitys;
  final List<City> soudicitys;
  final List<City> coutrys;
  final City selectedcity;
  final City selectedcoutry;
  final List<City> genders;

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
    this.pushertoken = '',
    this.id = 0,
    this.email = '',
    this.password = '',
    this.retypePassword = '',
    this.name = '',
    this.phone = '',
    this.selectedgender = const City(id: 0, name: ''),
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
    this.selectedpractices = const [],
    this.selectedlanguages = const [],
    this.uaecitys = const [
      City(id: 100, name: "Dubai"),
      City(id: 101, name: "Abu Dhabi"),
      City(id: 102, name: "Ajman"),
      City(id: 103, name: "Rak"),
      City(id: 104, name: "Fujairah"),
      City(id: 105, name: "UM ALQ"),
      City(id: 106, name: "Sharjah"),
    ],
    this.soudicitys = const [
      City(id: 1, name: "Riyadh"),
      City(id: 2, name: "Mecca"),
      City(id: 3, name: "Madina"),
      City(id: 4, name: "Damam"),
      City(id: 5, name: "Jeddah"),
      City(id: 6, name: "Khobar"),
      City(id: 7, name: "Abha"),
      City(id: 8, name: "Tabuk"),
      City(id: 9, name: "Hail"),
      City(id: 10, name: "Jazan"),
      City(id: 11, name: "Najran"),
      City(id: 12, name: "Baha"),
      City(id: 13, name: "AlJouf"),
    ],
    this.coutrys = const [
      City(id: 1, name: "Saudi"),
      City(id: 2, name: "UAE"),
    ],
    this.selectedcity = const City(id: 0, name: ''),
    this.selectedcoutry = const City(id: 0, name: ''),
    this.genders = const [
      City(id: 1, name: "Male"),
      City(id: 2, name: "Female"),
    ],
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
    String? pushertoken,
    int? id,
    String? email,
    String? image,
    String? password,
    String? retypePassword,
    String? name,
    String? phone,
    City? selectedgender,
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
    List<Practice>? practices,
    List<Language>? languages,
    List<Practice>? selectedpractices,
    List<Language>? selectedlanguages,
    List<City>? uaecitys,
    List<City>? soudicitys,
    List<City>? coutrys,
    City? selectedcity,
    City? selectedcoutry,
    List<City>? genders,
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
      pushertoken: pushertoken ?? this.pushertoken,
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      retypePassword: retypePassword ?? this.retypePassword,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      selectedgender: selectedgender ?? this.selectedgender,
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
      selectedpractices: selectedpractices ?? this.selectedpractices,
      selectedlanguages: selectedlanguages ?? this.selectedlanguages,
      uaecitys: uaecitys ?? this.uaecitys,
      soudicitys: soudicitys ?? this.soudicitys,
      coutrys: coutrys ?? this.coutrys,
      selectedcity: selectedcity ?? this.selectedcity,
      selectedcoutry: selectedcoutry ?? this.selectedcoutry,
      genders: genders ?? this.genders,

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
        pushertoken,
        id,
        email,
        password,
        retypePassword,
        name,
        phone,
        selectedgender,
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
        selectedpractices,
        selectedlanguages,
        uaecitys,
        soudicitys,
        coutrys,
        selectedcity,
        selectedcoutry,
        genders,
        contacts,
      ];
}
