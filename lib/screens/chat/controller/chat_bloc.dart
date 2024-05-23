import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:lawyer/core/utils/prefrences.dart';
import 'package:lawyer/models/message.dart';
import 'package:lawyer/models/messagemodel.dart';
import 'package:lawyer/screens/chat/data/chatrequest.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState()) {
    on<SendMessageInChatEvent>((event, emit) async {
      String? ptoken = Preferences.getToken();

      print("SendMessageInChatEvent");
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(token: ptoken));
        Response response = await SendMessageToUser.sendmessage(
            event.id, state.token, event.message, event.attachment);
        if (response.statusCode == 201) {
          emit(
            state.copyWith(),
          );
        } else {
          emit(
            state.copyWith(),
          );
        }
      } else {
        emit(state.copyWith(
          usermessage: "Unauthenticated",
        ));
      }
    });
    //
    on<GetMessagesInChatEvent>((event, emit) async {
      String? ptoken = Preferences.getToken();

      print("GetMessagesInChatEvent");
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(token: ptoken));
        Response response = await GetMessagesInChat.getmessages(
          event.id,
          state.token,
        );
        print(response.statusCode);
        print("data=${response.data}");

        // Map<String, dynamic> responsemap = await jsonDecode(response.data);
        if (response.statusCode == 200) {
          emit(
            state.copyWith(
              messages: List<MessageModel>.from(
                (response.data['messages'] as List).map(
                  (e) => MessageModel.fromJson(e),
                ),
              ),
            ),
          );
        } else {
          emit(
            state.copyWith(),
          );
        }
      } else {
        emit(state.copyWith(
          usermessage: "Unauthenticated",
        ));
      }
    });
    //
    on<GetAttachmentsInChatEvent>((event, emit) async {
      String? ptoken = Preferences.getToken();

      print("GetAttachmentsInChatEvent");
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(token: ptoken));
        Response response = await GetAttachmentsInChat.getattachments(
          event.id,
          state.token,
        );
        print(response.statusCode);
        print("data=${response.data}");

        // Map<String, dynamic> responsemap = await jsonDecode(response.data);
        if (response.statusCode == 200) {
          emit(
            state.copyWith(
              messages: List<MessageModel>.from(
                (response.data['messages'] as List).map(
                  (e) => MessageModel.fromJson(e),
                ),
              ),
            ),
          );
        } else {
          emit(
            state.copyWith(),
          );
        }
      } else {
        emit(state.copyWith(
          usermessage: "Unauthenticated",
        ));
      }
    });
    //
    on<SendMessageToGroupEvent>((event, emit) async {
      String? ptoken = Preferences.getToken();

      print("SendMessageToGroupEvent");
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(token: ptoken));
        Response response = await SendMessageToGroup.sendmessagetogroup(
            event.id, state.token, event.message, event.attachment);
        print(response.statusCode);
        print("data=${response.data}");

        // Map<String, dynamic> responsemap = await jsonDecode(response.data);
        if (response.statusCode == 200) {
          emit(
            state.copyWith(),
          );
        } else {
          emit(
            state.copyWith(),
          );
        }
      } else {
        emit(state.copyWith(
          usermessage: "Unauthenticated",
        ));
      }
    });
    //
    on<GetMessagesInGroupEvent>((event, emit) async {
      String? ptoken = Preferences.getToken();

      print("GetMessagesInGroupEvent");
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(token: ptoken));
        Response response = await GetMessagesInGroup.getmessagesingroup(
          event.id,
          state.token,
        );
        print(response.statusCode);
        print("data=${response.data}");

        // Map<String, dynamic> responsemap = await jsonDecode(response.data);
        if (response.statusCode == 200) {
          emit(
            state.copyWith(
              messages: List<MessageModel>.from(
                (response.data['messages'] as List).map(
                  (e) => MessageModel.fromJson(e),
                ),
              ),
            ),
          );
        } else {
          emit(
            state.copyWith(),
          );
        }
      } else {
        emit(state.copyWith(
          usermessage: "Unauthenticated",
        ));
      }
    });
    //
    on<GetAttachmentsInGroupEvent>((event, emit) async {
      String? ptoken = Preferences.getToken();

      print("GetAttachmentsInGroupEvent");
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(token: ptoken));
        Response response = await GetAttachmentsInGroup.getattachments(
          event.id,
          state.token,
        );
        print(response.statusCode);
        print("data=${response.data}");

        // Map<String, dynamic> responsemap = await jsonDecode(response.data);
        if (response.statusCode == 200) {
          emit(
            state.copyWith(
              messages: List<MessageModel>.from(
                (response.data['messages'] as List).map(
                  (e) => MessageModel.fromJson(e),
                ),
              ),
            ),
          );
        } else {
          emit(
            state.copyWith(),
          );
        }
      } else {
        emit(state.copyWith(
          usermessage: "Unauthenticated",
        ));
      }
    });
    //
    on<Bottomshow>((event, emit) async {
      emit(
        state.copyWith(
          bottom: event.bottom,
        ),
      );
    });
    //
    on<GetPusherConfig>((event, emit) async {
      String? ptoken = Preferences.getToken();

      print("GetPusherConfig");
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(token: ptoken));
        Response response =
            await GetPusherConfigrequest.getpusherconfig(ptoken);

        print(response.statusCode);
        print("data=${response.data}");

        // Map<String, dynamic> responsemap = await jsonDecode(response.data);
        if (response.statusCode == 200) {
          emit(
            state.copyWith(
              pushertoken: response.data['options']['auth']['headers']
                  ['Authorization'],
            ),
          );
        } else {
          emit(
            state.copyWith(),
          );
        }
      } else {
        emit(state.copyWith(
          usermessage: "Unauthenticated",
        ));
      }
    });
  }
}
