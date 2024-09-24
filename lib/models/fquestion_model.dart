import 'package:lawyer/models/fquestion.dart';

class FQuestionModel extends FQuestion {
  const FQuestionModel({
    required super.id,
    //
    required super.question,
    required super.answer,
    //
    required super.title,
    required super.shortDescription,
    required super.description,
    required super.createdAt,
    required super.img,
  });

  factory FQuestionModel.fromJson(Map<String, dynamic> json) => FQuestionModel(
        id: json['id'] ?? 0,
        //
        question: json['question'] ?? '',
        answer: json['answer'] ?? '',
        //
        title: json['title'] ?? '',
        shortDescription: json['shortDescription'] ?? '',
        description: json['description'] ?? '',
        createdAt: json['createdAt'] ?? 0,
        img: json['imag'] ?? '',
        //
      );
}
