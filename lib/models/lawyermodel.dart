import 'package:lawyer/models/consultationmodel.dart';
import 'package:lawyer/models/generalquestionmodel.dart';
import 'package:lawyer/models/group_model.dart';
import 'package:lawyer/models/lawyer.dart';
import 'package:lawyer/models/messagemodel.dart';
import 'package:lawyer/models/notifications_model.dart';

class LawyerModel extends Lawyer {
  const LawyerModel({
    required super.id,
    required super.name,
    required super.email,
    required super.birth,
    required super.gender,
    required super.phone,
    required super.consultationPrice,
    required super.isactive,
    required super.location,
    required super.yearsOfPractice,
    required super.numOfConsultation,
    required super.closedConsultation,
    required super.image,
    required super.certification,
    required super.practices,
    required super.consultations,
    required super.generalquestions,
    required super.senderMessage,
    required super.receiverMessage,
    required super.unreadNotifications,
    required super.groups,
  });

  factory LawyerModel.fromJson(Map<String, dynamic> json) => LawyerModel(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        email: json['email'] ?? '',
        birth: json['birth'] ?? '',
        gender: json['gender'] ?? 0,
        phone: json['phone'] ?? '',
        consultationPrice: json['consultationPrice'] ?? 0,
        isactive: json['isactive'] ?? 1,
        location: json['location'] ?? 1,
        yearsOfPractice: json['yearsOfPractice'] ?? '',
        numOfConsultation: json['numOfConsultation'] ?? 1,
        closedConsultation: json['closedConsultation'] ?? 0,
        image: json['image'] ?? '',
        certification: json['certification'] ?? [],
        practices: json['practices'] ?? [],
        consultations: List<ConsultationsModel>.from(
          ((json['consultations'] ?? []) as List).map(
            (e) => ConsultationsModel.fromJson(e),
          ),
        ),
        generalquestions: List<GeneralquestionModel>.from(
          ((json['generalQuestions'] ?? []) as List).map(
            (e) => GeneralquestionModel.fromJson(e),
          ),
        ),
        senderMessage: List<MessageModel>.from(
          ((json['senderMessage'] ?? []) as List).map(
            (e) => MessageModel.fromJson(e),
          ),
        ),
        receiverMessage: List<MessageModel>.from(
          ((json['receiverMessage'] ?? []) as List).map(
            (e) => MessageModel.fromJson(e),
          ),
        ),
        unreadNotifications: List<NotificationsModel>.from(
          ((json['unreadNotifications'] ?? []) as List).map(
            (e) => NotificationsModel.fromJson(e),
          ),
        ),
        groups: List<GroupsModel>.from(
          ((json['groups'] ?? []) as List).map(
            (e) => GroupsModel.fromJson(e),
          ),
        ),
      );
}
