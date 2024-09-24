import 'package:lawyer/models/consultationmodel.dart';
import 'package:lawyer/models/generalquestionmodel.dart';
import 'package:lawyer/models/group_model.dart';
import 'package:lawyer/models/language_model.dart';
import 'package:lawyer/models/lawyer.dart';
import 'package:lawyer/models/messagemodel.dart';
import 'package:lawyer/models/notifications_model.dart';
import 'package:lawyer/models/practice_model.dart';

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
    required super.country,
    required super.yearsOfPractice,
    required super.numOfConsultation,
    required super.closedConsultation,
    required super.profile,
    required super.certification,
    required super.licenses,
    required super.practices,
    required super.languages,
    required super.consultationsReceiver,
    required super.consultationsSender,
    required super.generalquestions,
    required super.senderMessage,
    required super.receiverMessage,
    required super.unreadNotifications,
    required super.groups,
    required super.role,
    required super.city,
    required super.emiratesId,
    required super.frontEmiratesId,
    required super.backEmiratesId,
    required super.occupation,
    required super.generalChats,
    required super.landLine,
    required super.location,
    required super.available,
    required super.bio,
    required super.facebook,
    required super.tiktok,
  });

  factory LawyerModel.fromJson(Map<String, dynamic> json) => LawyerModel(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        email: json['email'] ?? '',
        birth: json['birth'] ?? '',
        gender: json['gender'] ?? 0,
        phone: json['phone'] ?? '',
        consultationPrice: json["lawyer"]?['consultationPrice'] ?? 0,
        isactive: json['isactive'] ?? 1,
        role: json['role'] ?? '',
        country: json['country'] ?? '',
        city: json['city'] ?? '',
        emiratesId: json['emiratesId'] ?? 0,
        frontEmiratesId: json['frontEmiratesId'] ?? '',
        backEmiratesId: json['backEmiratesId'] ?? '',
        occupation: json['client']?['occupation'] ?? '',
        yearsOfPractice: json["lawyer"]?['yearsOfPractice'] ?? '',
        numOfConsultation: json["lawyer"]?['numOfConsultation'] ?? 1,
        closedConsultation: json["lawyer"]?['closedConsultation'] ?? 0,
        profile: json['profile'] ?? '',
        certification: List<String>.from(
            ((json["lawyer"]?['certification'] ?? []) as List)),
        licenses:
            List<String>.from(((json["lawyer"]?['licenses'] ?? []) as List)),
        practices: List<PracticeModel>.from(
          ((json['practices'] ?? []) as List).map(
            (e) => PracticeModel.fromJson(e),
          ),
        ),
        languages: List<LanguageModel>.from(
          ((json['languages'] ?? []) as List).map(
            (e) => LanguageModel.fromJson(e),
          ),
        ),
        consultationsReceiver: List<ConsultationsModel>.from(
          ((json['consultationsReceiver'] ?? []) as List).map(
            (e) => ConsultationsModel.fromJson(e),
          ),
        ),
        consultationsSender: List<ConsultationsModel>.from(
          ((json['consultationsSender'] ?? []) as List).map(
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
        generalChats: List<GroupsModel>.from(
          ((json['generalChats'] ?? []) as List).map(
            (e) => GroupsModel.fromJson(e),
          ),
        ),
        landLine: json["lawyer"]?['landLine'] ?? '',
        location: json["lawyer"]?['location'] ?? '',
        available: json["lawyer"]?['available'] ?? '',
        bio: json["lawyer"]?['bio'] ?? '',
        facebook: json["lawyer"]?['facebook'] ?? '',
        tiktok: json["lawyer"]?['tiktok'] ?? '',
      );
}
