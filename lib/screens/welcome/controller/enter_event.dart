part of 'enter_bloc.dart';

abstract class EnterEvent extends Equatable {}

class Getuser extends EnterEvent {
  Getuser();

  @override
  List<Object?> get props => [];
}

class LanguageChanged extends EnterEvent {
  final String? language;

  LanguageChanged({this.language});

  @override
  List<Object?> get props => [language];
}

class ImageChange extends EnterEvent {
  final File? fimage;

  ImageChange({this.fimage});

  @override
  List<Object?> get props => [fimage];
}

class Bottomshow extends EnterEvent {
  final bool? bottom;
  final String? destenation;

  Bottomshow({this.bottom, this.destenation});

  @override
  List<Object?> get props => [bottom, destenation];
}

class AddCertification extends EnterEvent {
  final List<File>? certifications;

  AddCertification({this.certifications});

  @override
  List<Object?> get props => [certifications];
}

class AddExpertise extends EnterEvent {
  final String? expertise;

  AddExpertise({this.expertise});

  @override
  List<Object?> get props => [expertise];
}

class CheckAvailable extends EnterEvent {
  final bool? available;

  CheckAvailable({this.available});

  @override
  List<Object?> get props => [available];
}

class Profiledit extends EnterEvent {
  final File? fimage;
  final String? name;
  final String? email;
  final String? number;
  final String? birth;
  final int? location;
  final int? gender;
  final int? consultationPrice;
  final List<File>? certification;
  Profiledit({
    this.fimage,
    this.name,
    this.email,
    this.number,
    this.birth,
    this.location,
    this.gender,
    this.consultationPrice,
    this.certification,
  });

  @override
  List<Object?> get props => [
        fimage,
        name,
        email,
        number,
        birth,
        location,
        gender,
        consultationPrice,
        certification,
      ];
}

class LoginEmailChanged extends EnterEvent {
  final String? email;

  LoginEmailChanged({this.email});

  @override
  List<Object?> get props => [email];
}

class LoginPasswordChanged extends EnterEvent {
  final String? password;

  LoginPasswordChanged({this.password});

  @override
  List<Object?> get props => [password];
}

class LoginReTypePasswordChanged extends EnterEvent {
  final String? retypePassword;

  LoginReTypePasswordChanged({this.retypePassword});

  @override
  List<Object?> get props => [retypePassword];
}

class LoginNameChanged extends EnterEvent {
  final String? name;

  LoginNameChanged({this.name});

  @override
  List<Object?> get props => [name];
}

class LoginNumberChanged extends EnterEvent {
  final String? number;

  LoginNumberChanged({this.number});

  @override
  List<Object?> get props => [number];
}

class GenderChanged extends EnterEvent {
  final String? gender;

  GenderChanged({this.gender});

  @override
  List<Object?> get props => [gender];
}

class BirthChanged extends EnterEvent {
  final String? birth;

  BirthChanged({this.birth});

  @override
  List<Object?> get props => [birth];
}

class CountryChanged extends EnterEvent {
  final String? country;

  CountryChanged({this.country});

  @override
  List<Object?> get props => [country];
}

class CityChanged extends EnterEvent {
  final String? city;

  CityChanged({this.city});

  @override
  List<Object?> get props => [city];
}

class EidNumberChanged extends EnterEvent {
  final String? eidnumber;

  EidNumberChanged({this.eidnumber});

  @override
  List<Object?> get props => [eidnumber];
}

class DobChanged extends EnterEvent {
  final String? dob;

  DobChanged({this.dob});

  @override
  List<Object?> get props => [dob];
}

class LandLineChanged extends EnterEvent {
  final String? landline;

  LandLineChanged({this.landline});

  @override
  List<Object?> get props => [landline];
}

class OccupationChanged extends EnterEvent {
  final String? occupation;

  OccupationChanged({this.occupation});

  @override
  List<Object?> get props => [occupation];
}

class ConsultationPriceChanged extends EnterEvent {
  final String? consultationprice;

  ConsultationPriceChanged({this.consultationprice});

  @override
  List<Object?> get props => [consultationprice];
}

class BiographyChanged extends EnterEvent {
  final String? biography;

  BiographyChanged({this.biography});

  @override
  List<Object?> get props => [biography];
}

class TypeChanged extends EnterEvent {
  final String? type;

  TypeChanged({this.type});

  @override
  List<Object?> get props => [type];
}

class LoginSubmitted extends EnterEvent {
  @override
  List<Object?> get props => [];
}

class Logout extends EnterEvent {
  final String? token;
  Logout({this.token});

  @override
  List<Object?> get props => [token];
}

class ClientRegisterSubmitted extends EnterEvent {
  @override
  List<Object?> get props => [];
}

class LawyerRegisterSubmitted extends EnterEvent {
  @override
  List<Object?> get props => [];
}
