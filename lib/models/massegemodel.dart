import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final bool isMe;
  final String text;
  final String type;
  const Message({required this.isMe, required this.text, required this.type});

  @override
  List<Object?> get props => [isMe, text, type];
}
