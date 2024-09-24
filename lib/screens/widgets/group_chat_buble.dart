import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/models/message.dart';
import 'package:lawyer/screens/widgets/black12text.dart';
import 'package:lawyer/screens/widgets/chat_text_buble.dart';
import 'package:lawyer/screens/widgets/pdf_widget.dart';

class GroupChatBubble extends StatelessWidget {
  final Message message;
  final bool isMe;
  const GroupChatBubble({
    super.key,
    required this.message,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("/////////////");
    print(message);
    print(isMe);
    if (message.type!.isNotEmpty) {
      if (message.type == "pdf") {
        return Padding(
          padding: EdgeInsets.only(
              top: 20.h,
              bottom: 20.h,
              left: (isMe) ? 100.w : 5.w,
              right: (isMe) ? 5.w : 100.w),
          child: Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.h),
                child: Black12text(text: message.sender!.name),
              ),
              PdfWidget(file: message.file!),
            ],
          ),
        );
      } else if (message.type == "png" ||
          message.type == "jpg" ||
          message.type == "jpeg") {
        return Padding(
          padding: EdgeInsets.only(
              top: 20.h,
              bottom: 20.h,
              left: (isMe) ? 100.w : 5.w,
              right: (isMe) ? 5.w : 100.w),
          child: Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.h),
                child: Black12text(text: message.sender!.name),
              ),
              Image.file(message.file!),
            ],
          ),
        );
      } else {
        return ChatTextBuble(isMe: isMe, message: message);
      }
    } else {
      if (message.attachment!.isNotEmpty) {
        if (message.attachment!.split(".").last == "pdf") {
          return Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              FutureBuilder<File>(
                  future:
                      DefaultCacheManager().getSingleFile(message.attachment!),
                  builder: (context, snapshot) {
                    return (snapshot.hasData)
                        ? Padding(
                            padding: EdgeInsets.only(
                                top: 20.h,
                                bottom: 20.h,
                                left: (isMe) ? 100.w : 5.w,
                                right: (isMe) ? 5.w : 100.w),
                            child: Column(
                              crossAxisAlignment: isMe
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 0.h),
                                  child:
                                      Black12text(text: message.sender!.name),
                                ),
                                PdfWidget(file: snapshot.data!),
                              ],
                            ),
                          )
                        : const SizedBox.shrink();
                  }),
            ],
          );
        } else {
          return Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 20.h,
                    bottom: 20.h,
                    left: (isMe) ? 100.w : 5.w,
                    right: (isMe) ? 5.w : 100.w),
                child: Column(
                  crossAxisAlignment:
                      isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.h),
                      child: Black12text(text: message.sender!.name),
                    ),
                    Material(
                      elevation: 5,
                      child: Container(
                        // width: size.width / 2.5,
                        // height: size.height / 4,
                        decoration: const BoxDecoration(
                            // color: AppColor.appgray,
                            ),
                        child: Image.network(
                          message.attachment!,
                          // fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      } else {
        return ChatTextBuble(isMe: isMe, message: message);
      }
    }
  }
}
