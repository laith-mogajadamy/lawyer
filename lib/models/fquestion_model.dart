import 'package:lawyer/models/fquestion.dart';

class FQuestionModel extends FQuestion {
  const FQuestionModel({
    required super.id,
    required super.title,
    required super.shortDescription,
    required super.description,
    required super.createdAt,
    required super.img,
  });

  factory FQuestionModel.fromJson(Map<String, dynamic> json) => FQuestionModel(
        id: json['id'] ?? '',
        title: json['title'] ?? '',
        shortDescription: json['shortDescription'] ?? '',
        description: json['description'] ?? '',
        createdAt: json['createdAt'] ?? 0,
        img: json['imag'] ?? '',
        //
      );
}
