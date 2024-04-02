import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String token;
  final String email;
  final String name;
  final String number;
  final String type;

  final String password;

  const User(
      {required this.token,
      required this.email,
      required this.name,
      required this.number,
      required this.type,
      required this.password});

  @override
  List<Object?> get props => [token, email, name, number, type, password];
}
