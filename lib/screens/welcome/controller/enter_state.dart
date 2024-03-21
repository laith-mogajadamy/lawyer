part of 'enter_bloc.dart';

class EnterState extends Equatable {
  final String username;
  bool get isValidUsername => username.length > 3;

  final String password;
  bool get isValidPassword => password.length > 6;

  final FormSubmissionStatus formStatus;

  const EnterState({
    this.username = '',
    this.password = '',
    this.formStatus = const InitialFormStatus(),
  });

  EnterState copyWith({
    String? username,
    String? password,
    FormSubmissionStatus? formStatus,
  }) {
    return EnterState(
      username: username ?? this.username,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  @override
  List<Object?> get props => [username, password, formStatus];
}
