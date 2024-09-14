import 'package:equatable/equatable.dart';

class FQuestion extends Equatable {
  final dynamic id;
//
  final dynamic question;
  final dynamic answer;
//
  final dynamic title;
  final dynamic shortDescription;
  final dynamic description;

  final dynamic createdAt;
  final dynamic img;
  //
  const FQuestion({
    required this.id,
    //
    required this.question,
    required this.answer,
    //
    required this.title,
    required this.shortDescription,
    required this.description,
    required this.createdAt,
    required this.img,
  });

  @override
  List<Object?> get props => [
        id,
        //
        question,
        answer,
        //
        title,
        shortDescription,
        description,
        createdAt,
        img,
        //
      ];
}
