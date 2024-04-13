import 'package:equatable/equatable.dart';
import 'package:lawyer/models/consultation.dart';
import 'package:lawyer/models/general_question.dart';

class Lawyer extends Equatable {
  final int id;
  final String name;
  final String email;
  final String? birth;
  final int? gender;
  final String phone;
  final int? consultationPrice;
  final int isactive;
  final int location;
  final String? yearsOfPractice;
  final int numOfConsultation;
  final int closedConsultation;
  final String image;
  final List<Consultation>? consultations;
  final List<Generalquestion>? generalquestions;

  final List certification;
  final List practices;

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
      ];
}
