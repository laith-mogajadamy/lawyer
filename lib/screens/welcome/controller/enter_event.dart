part of 'enter_bloc.dart';

abstract class EnterEvent extends Equatable {}

class LoginUsernameChanged extends EnterEvent {
  final String? username;

  LoginUsernameChanged({this.username});

  @override
  List<Object?> get props => [username];
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

class RegisterSubmitted extends EnterEvent {
  @override
  List<Object?> get props => [];
}
