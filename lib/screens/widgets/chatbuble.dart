import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/services/pdf_api.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/screens/widgets/image_widget.dart';
import 'package:lawyer/screens/widgets/pdf_widget.dart';

class ChatBubble extends StatelessWidget {
  final bool isMe;
  final String message;
  final String type;
  final File? file;
  const ChatBubble(
      {super.key,
      required this.message,
      required this.isMe,
      required this.type,
      required this.file});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (type == "pdf" && file != null) {
      return Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          PdfWidget(file: file!),
        ],
      );
    } else if (type == "img" && file != null) {
      return Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          ImageWidget(file: file!),
        ],
      );
    } else {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        padding:
            isMe ? EdgeInsets.only(left: 40.w) : EdgeInsets.only(right: 40.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              mainAxisAlignment:
                  isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
              crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    gradient: isMe
                        ? const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            stops: [0.1, 1],
                            colors: [Color(0xFFF6D365), Color(0xFFFDA085)])
                        : const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            stops: [0.1, 1],
                            colors: [Color(0xFFEBF5FC), Color(0xFFEBF5FC)]),
                    borderRadius: isMe
                        ? BorderRadius.only(
                            topRight: Radius.circular(15.r),
                            topLeft: Radius.circular(15.r),
                            bottomRight: Radius.circular(0.r),
                            bottomLeft: Radius.circular(15.r),
                          )
                        : BorderRadius.only(
                            topRight: Radius.circular(15.r),
                            topLeft: Radius.circular(15.r),
                            bottomRight: Radius.circular(15.r),
                            bottomLeft: Radius.circular(0.r),
                          ),
                  ),
                  child: Column(
                    crossAxisAlignment: isMe
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Text(
                        message,
                        textAlign: isMe ? TextAlign.end : TextAlign.start,
                        style: TextStyle(
                          decorationThickness: 2,
                          decorationColor: AppColor.apporange,
                          color: isMe ? Colors.white : Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }
  }
}
