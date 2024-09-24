import 'package:lawyer/models/practice.dart';

class PracticeModel extends Practice {
  const PracticeModel({
    required super.name,
    required super.id,
    required super.description,
  });

  factory PracticeModel.fromJson(Map<String, dynamic> json) => PracticeModel(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        description: json['description'] ?? '',
      );
}
