import 'dart:io';

import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final bool isMe;
  final String text;
  final String type;
  final File? file;
  const Message(
      {required this.isMe,
      required this.text,
      required this.type,
      required this.file});

  @override
  List<Object?> get props => [isMe, text, type, file];
}
