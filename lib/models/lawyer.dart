import 'package:equatable/equatable.dart';
import 'package:lawyer/models/consultation.dart';
import 'package:lawyer/models/general_question.dart';
import 'package:lawyer/models/group.dart';
import 'package:lawyer/models/message.dart';
import 'package:lawyer/models/notifications.dart';

class Lawyer extends Equatable {
  final int id;
  final String name;
  final String email;
  final dynamic birth;
  final dynamic gender;
  final dynamic phone;
  final dynamic consultationPrice;
  final dynamic isactive;
  final dynamic role;
  final dynamic country;
  final dynamic city;
  final dynamic emiratesId;
  final dynamic frontEmiratesId;
  final dynamic backEmiratesId;
  final dynamic occupation;
  final dynamic yearsOfPractice;
  final dynamic numOfConsultation;
  final dynamic closedConsultation;
  final String image;
  final List<Consultation>? consultations;
  final List<Generalquestion>? generalquestions;
  final List<Message>? senderMessage;
  final List<Message>? receiverMessage;

  final List? certification;
  final List? practices;
  final List<Notifications>? unreadNotifications;
  final List<Groups>? groups;

  const Lawyer({
    required this.id,
    required this.name,
    required this.email,
    required this.birth,
    required this.gender,
    required this.phone,
    required this.consultationPrice,
    required this.isactive,
    required this.role,
    required this.country,
    required this.city,
    required this.emiratesId,
    required this.frontEmiratesId,
    required this.backEmiratesId,
    required this.occupation,
    required this.yearsOfPractice,
    required this.numOfConsultation,
    required this.closedConsultation,
    required this.image,
    required this.certification,
    required this.practices,
    required this.consultations,
    required this.generalquestions,
    required this.senderMessage,
    required this.receiverMessage,
    required this.unreadNotifications,
    required this.groups,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        birth,
        gender,
        phone,
        consultationPrice,
        isactive,
        country,
        yearsOfPractice,
        numOfConsultation,
        closedConsultation,
        image,
        certification,
        practices,
        consultations,
        generalquestions,
        senderMessage,
        receiverMessage,
        unreadNotifications,
        groups,
      ];
}
