import 'dart:io';
import 'package:lawyer/models/lawyer.dart';
import 'package:lawyer/models/lawyermodel.dart';
import 'package:lawyer/models/message.dart';

class MessageModel extends Message {
  const MessageModel({
    required super.isMe,
    required super.text,
    required super.type,
    required super.file,
    required super.attachment,
    required super.sender,
    required super.receiver,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        isMe: json['isMe'] ?? false,
        text: json['message'] ?? '',
        type: json['type'] ?? '',
        file: json['file'] ?? File(''),
        attachment: json['attachment'] ?? '',
        sender: LawyerModel.fromJson(json['sender'] ?? {}),
        receiver: LawyerModel.fromJson(json['receiver'] ?? {}),
      );
}
