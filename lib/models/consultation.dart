import 'package:equatable/equatable.dart';
import 'package:lawyer/models/lawyermodel.dart';

class Consultation extends Equatable {
  final int id;
  final String title;
  final String description;
  final int status;
  final String answer;
  final String createdOn;
  final LawyerModel sender;
  final LawyerModel receiver;

  const Consultation({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.answer,
    required this.createdOn,
    required this.sender,
    required this.receiver,
  });

  @override
  List<Object?> get props =>
      [id, title, description, status, answer, createdOn, sender, receiver];
}
