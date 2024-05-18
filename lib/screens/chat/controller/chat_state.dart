part of 'chat_bloc.dart';

// ignore: must_be_immutable
class ChatState extends Equatable {
  final String token;
  //
  List<Message> messages;
  final String usermessage;
  final bool bottom;

  ChatState({
    this.token = '',
    this.messages = const [],
    this.usermessage = '',
    this.bottom = false,
  });

  ChatState copyWith({
    String? token,
    List<Message>? messages,
    String? usermessage,
    bool? bottom,
  }) {
    return ChatState(
      token: token ?? this.token,
      messages: messages ?? this.messages,
      usermessage: usermessage ?? this.usermessage,
      bottom: bottom ?? this.bottom,
    );
  }

  @override
  List<Object?> get props => [
        token,
        messages,
        usermessage,
        bottom,
      ];
}
