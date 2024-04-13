import 'package:lawyer/models/consultation.dart';
import 'package:lawyer/models/lawyermodel.dart';

class ConsultationsModel extends Consultation {
  const ConsultationsModel({
    required super.id,
    required super.title,
    required super.description,
    required super.status,
    required super.answer,
    required super.createdOn,
    required super.sender,
    required super.receiver,
  });

  factory ConsultationsModel.fromJson(Map<String, dynamic> json) =>
      ConsultationsModel(
        id: json['id'] ?? 0,
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        status: json['status'] ?? 0,
        answer: json['answer'] ?? '',
        createdOn: json['createdOn'] ?? '',
        sender: LawyerModel.fromJson(json['sender']),
        receiver: LawyerModel.fromJson(json['receiver']),
      );
}
