import 'package:equatable/equatable.dart';
import 'package:lawyer/models/consultation.dart';
import 'package:lawyer/models/general_question.dart';
import 'package:lawyer/models/group.dart';
import 'package:lawyer/models/language.dart';
import 'package:lawyer/models/message.dart';
import 'package:lawyer/models/notifications.dart';
import 'package:lawyer/models/practice.dart';

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
  final String profile;
  final List<Consultation>? consultationsReceiver;
  final List<Consultation>? consultationsSender;
  final List<Generalquestion>? generalquestions;
  final List<Message>? senderMessage;
  final List<Message>? receiverMessage;

  final List<String>? certification;
  final List<Practice>? practices;
  final List<Language>? languages;

  final List<Notifications>? unreadNotifications;
  final List<Groups>? groups;
  final List<Groups>? generalChats;

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
    required this.profile,
    required this.certification,
    required this.practices,
    required this.languages,
    required this.consultationsReceiver,
    required this.consultationsSender,
    required this.generalquestions,
    required this.senderMessage,
    required this.receiverMessage,
    required this.unreadNotifications,
    required this.groups,
    required this.generalChats,
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
        role,
        country,
        city,
        emiratesId,
        frontEmiratesId,
        backEmiratesId,
        occupation,
        yearsOfPractice,
        numOfConsultation,
        closedConsultation,
        profile,
        certification,
        practices,
        languages,
        consultationsReceiver,
        consultationsSender,
        generalquestions,
        senderMessage,
        receiverMessage,
        unreadNotifications,
        groups,
        generalChats,
      ];
}
