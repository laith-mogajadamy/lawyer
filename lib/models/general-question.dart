import 'package:equatable/equatable.dart';
import 'package:lawyer/models/generalquestionmodel.dart';
import 'package:lawyer/models/lawyer.dart';
import 'package:lawyer/models/lawyermodel.dart';

class Generalquestion extends Equatable {
  final int id;
  final String question;
  final String date;
  final int isReply;
  final LawyerModel userRequest;
  final List<RepliesModel> replies;
  const Generalquestion({
    required this.id,
    required this.question,
    required this.date,
    required this.isReply,
    required this.userRequest,
    required this.replies,
  });

  @override
  List<Object?> get props =>
      [id, question, date, isReply, userRequest, replies];
}

class Replies extends Equatable {
  final int id;
  final String reply;
  final String? rate;
  final String date;
  final LawyerModel userResponse;

  const Replies({
    required this.id,
    required this.reply,
    required this.rate,
    required this.date,
    required this.userResponse,
  });

  @override
  List<Object?> get props => [id, reply, rate, date, userResponse];
}
