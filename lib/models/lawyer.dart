import 'package:equatable/equatable.dart';

class Lawyer extends Equatable {
  final int id;
  final String name;
  final String email;
  final String? birth;
  final String? gender;
  final String phone;
  final String? consultationPrice;
  final int isactive;
  final int location;
  final String? yearsOfPractice;
  final int numOfConsultation;
  final int closedConsultation;
  final String image;
  final dynamic certification;
  final dynamic practices;

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
      ];
}
