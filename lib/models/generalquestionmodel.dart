import 'package:lawyer/models/general_question.dart';
import 'package:lawyer/models/lawyer.dart';
import 'package:lawyer/models/lawyermodel.dart';

class GeneralquestionModel extends Generalquestion {
  const GeneralquestionModel({
    required super.id,
    required super.question,
    required super.date,
    required super.isReply,
    required super.userRequest,
    required super.replies,
  });

  factory GeneralquestionModel.fromJson(Map<String, dynamic> json) =>
      GeneralquestionModel(
        id: json['id'] ?? 0,
        question: json['question'] ?? '',
        date: json['date'] ?? '',
        isReply: json['isReply'] ?? 0,
        userRequest: LawyerModel.fromJson(json['userRequest'] ?? {}),
        replies: ((json['replies'] ?? []) as List)
            .map((data) => RepliesModel.fromJson(data))
            .toList(),
      );
}

class RepliesModel extends Replies {
  const RepliesModel({
    required super.id,
    required super.reply,
    required super.rate,
    required super.date,
    required super.userResponse,
  });

  factory RepliesModel.fromJson(Map<String, dynamic> json) => RepliesModel(
        id: json['id'] ?? 0,
        reply: json['reply'] ?? '',
        rate: json['rate'] ?? '',
        date: json['date'] ?? '',
        userResponse: LawyerModel.fromJson(json['userResponse'] ?? {}),
      );
}
