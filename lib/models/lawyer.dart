import 'package:equatable/equatable.dart';
import 'package:lawyer/models/consultation.dart';
import 'package:lawyer/models/general_question.dart';
import 'package:lawyer/models/message.dart';

class Lawyer extends Equatable {
  final int id;
  final String name;
  final String email;
  final dynamic birth;
  final dynamic gender;
  final dynamic phone;
  final dynamic consultationPrice;
  final dynamic isactive;
  final dynamic location;
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

  const Lawyer({
    required this.id,
    required this.name,
    required this.email,
    required this.birth,
    required this.gender,
    required this.phone,
    required this.consultationPrice,
    required this.isactive,
    required this.location,
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
        location,
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
      ];
}
