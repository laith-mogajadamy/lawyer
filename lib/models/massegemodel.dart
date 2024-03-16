import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final bool isMe;
  final String text;

  const Message({required this.isMe, required this.text});

  @override
  List<Object?> get props => [isMe, text];
}
