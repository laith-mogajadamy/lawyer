part of 'enter_bloc.dart';

class EnterState extends Equatable {
  final String islogedin;
  //didnt use it
  final User user;
  //
  final String token;
  final String email;
  bool get isValidUsername => email.length > 10;
  final String password;
  bool get isValidPassword => password.length > 6;
  final String name;
  final String number;
  bool get isValidnumber => number.length >= 10;
  final String type;
  final FormSubmissionStatus formStatus;
  final String message;
  const EnterState({
    this.user = const User(
        token: "", email: "", name: "", number: "", type: "", password: ""),
    this.islogedin = '',
    this.token = '',
    this.email = '',
    this.password = '',
    this.name = '',
    this.number = '',
    this.type = '',
    this.message = '',
    this.formStatus = const InitialFormStatus(),
  });

  EnterState copyWith({
    String? islogedin,
    User? user,
    String? token,
    String? email,
    String? password,
    String? name,
    String? number,
    String? type,
    String? message,
    FormSubmissionStatus? formStatus,
  }) {
    return EnterState(
      islogedin: islogedin ?? this.islogedin,
      user: user ?? this.user,
      token: token ?? this.token,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      number: number ?? this.number,
      type: type ?? this.type,
      message: message ?? this.message,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  @override
  List<Object?> get props => [
        islogedin,
        token,
        email,
        password,
        name,
        number,
        type,
        message,
        formStatus
      ];
}
