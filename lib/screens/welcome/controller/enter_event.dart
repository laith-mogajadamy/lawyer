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

  Bottomshow({this.bottom});

  @override
  List<Object?> get props => [bottom];
}

class AddCertification extends EnterEvent {
  final List<File>? certifications;

  AddCertification({this.certifications});

  @override
  List<Object?> get props => [certifications];
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

class RegisterSubmitted extends EnterEvent {
  @override
  List<Object?> get props => [];
}
