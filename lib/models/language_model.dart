import 'package:lawyer/models/language.dart';

class LanguageModel extends Language {
  const LanguageModel({
    required super.name,
    required super.id,
  });

  factory LanguageModel.fromJson(Map<String, dynamic> json) => LanguageModel(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
      );
}
