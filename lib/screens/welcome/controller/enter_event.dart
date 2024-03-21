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

class LoginSubmitted extends EnterEvent {
  @override
  List<Object?> get props => [];
}
