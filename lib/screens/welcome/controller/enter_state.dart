part of 'enter_bloc.dart';

class EnterState extends Equatable {
  final String username;
  bool get isValidUsername => username.length > 3;

  final String password;
  bool get isValidPassword => password.length > 6;
  final String name;
  final String number;
  bool get isValidnumber => number.length > 10;
  final String type;
  final FormSubmissionStatus formStatus;

  const EnterState({
    this.username = '',
    this.password = '',
    this.name = '',
    this.number = '',
    this.type = '',
    this.formStatus = const InitialFormStatus(),
  });

  EnterState copyWith({
    String? username,
    String? password,
    String? name,
    String? number,
    String? type,
    FormSubmissionStatus? formStatus,
  }) {
    return EnterState(
      username: username ?? this.username,
      password: password ?? this.password,
      name: name ?? this.name,
      number: number ?? this.number,
      type: type ?? this.type,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  @override
  List<Object?> get props =>
      [username, password, name, number, type, formStatus];
}
