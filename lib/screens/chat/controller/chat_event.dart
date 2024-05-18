part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {}

class SendMessageInChatEvent extends ChatEvent {
  final int id;
  final String? message;
  final File? attachment;
  SendMessageInChatEvent(
      {required this.id, required this.message, required this.attachment});

  @override
  List<Object?> get props => [id, message, attachment];
}

class GetMessagesInChatEvent extends ChatEvent {
  final int id;

  GetMessagesInChatEvent({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}

class GetAttachmentsInChatEvent extends ChatEvent {
  final int id;

  GetAttachmentsInChatEvent({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}

class SendMessageToGroupEvent extends ChatEvent {
  final int id;
  final String? message;
  final File? attachment;
  SendMessageToGroupEvent(
      {required this.id, required this.message, required this.attachment});

  @override
  List<Object?> get props => [id, message, attachment];
}

class GetMessagesInGroupEvent extends ChatEvent {
  final int id;

  GetMessagesInGroupEvent({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}

class GetAttachmentsInGroupEvent extends ChatEvent {
  final int id;

  GetAttachmentsInGroupEvent({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}

class Bottomshow extends ChatEvent {
  final bool? bottom;
  final String? destenation;

  Bottomshow({this.bottom, this.destenation});

  @override
  List<Object?> get props => [bottom, destenation];
}
