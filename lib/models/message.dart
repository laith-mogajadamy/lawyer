import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:lawyer/models/lawyer.dart';

class Message extends Equatable {
  final bool? isMe;
  final String? text;
  final String? type;
  final File? file;
  final String? attachment;
  final Lawyer? sender;
  final Lawyer? receiver;

  const Message({
    required this.isMe,
    required this.text,
    required this.type,
    required this.file,
    required this.attachment,
    required this.sender,
    required this.receiver,
  });

  @override
  List<Object?> get props =>
      [isMe, text, type, file, attachment, sender, receiver];
}
