import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/models/lawyer.dart';
import 'package:lawyer/models/message.dart';
import 'package:lawyer/screens/chat/controller/chat_bloc.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({
    super.key,
    required this.messageController,
    required this.otheruser,
    required this.myself,
    required this.messages,
    required this.messagesstream,
  });

  final TextEditingController messageController;
  final Lawyer otheruser;
  final Lawyer myself;

  final List<Message> messages;
  final StreamController<Message> messagesstream;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
          height: size.height / 14,
          width: size.width / 1,
          child: TextFormField(
            autofocus: true,
            onChanged: (string) {},
            controller: messageController,
            enabled: true,
            style: TextStyle(color: Colors.black, fontSize: 18.sp),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2.h, color: Colors.black),
                borderRadius: BorderRadius.circular(20.r),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 2.h, color: Colors.black),
                borderRadius: BorderRadius.circular(20.r),
              ),
              hintStyle: const TextStyle(color: Colors.grey),
              filled: true,
              fillColor: AppColor.appgray,
              suffix: InkWell(
                onTap: () {
                  String messageText = messageController.text.trim();
                  if (messageText.isNotEmpty) {
                    context.read<ChatBloc>().add(
                          SendMessageInChatEvent(
                              attachment: null,
                              message: messageText,
                              id: otheruser.id),
                        );
                    Message message = Message(
                        isMe: true,
                        message: messageText,
                        type: "text",
                        file: null,
                        attachment: "text",
                        sender: myself,
                        receiver: otheruser);
                    messages.insert(0, message);
                    messagesstream.sink.add(message);
                    messageController.clear();
                    // You can add logic here to send the message to the other user or store it.
                  }
                },
                child: Icon(
                  Icons.send,
                  size: 25.r,
                ),
              ),
              prefix: InkWell(
                onTap: () {
                  // SystemChannels.textInput
                  //     .invokeMethod('TextInput.hide');
                  bool bottom = !state.bottom;
                  context.read<ChatBloc>().add(
                        Bottomshow(
                          bottom: bottom,
                        ),
                      );
                },
                child: Icon(
                  Icons.attachment,
                  size: 25.r,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
