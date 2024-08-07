import 'package:lawyer/models/news.dart';

class NewsModel extends NewsM {
  const NewsModel({
    required super.id,
    required super.title,
    required super.shortDescription,
    required super.description,
    required super.createdAt,
    required super.img,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        id: json['id'] ?? '',
        title: json['title'] ?? '',
        shortDescription: json['shortDescription'] ?? '',
        description: json['description'] ?? '',
        createdAt: json['createdAt'] ?? 0,
        img: json['img'] ?? '',
        //
      );
}
