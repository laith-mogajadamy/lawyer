import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/models/message.dart';
import 'package:lawyer/screens/widgets/black12text.dart';

class ChatTextBuble extends StatelessWidget {
  const ChatTextBuble({
    super.key,
    required this.isMe,
    required this.message,
  });

  final bool isMe;
  final Message message;

  @override
  Widget build(BuildContext context) {
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
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
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
                  crossAxisAlignment:
                      isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 0.w, vertical: 3.h),
                      child: Black12text(text: message.sender!.name),
                    ),
                    Text(
                      message.message!,
                      textAlign: isMe ? TextAlign.end : TextAlign.start,
                      style: TextStyle(
                        fontSize: 16.sp,
                        decorationThickness: 2,
                        decorationColor: AppColor.apporange,
                        color: isMe ? Colors.white : AppColor.offblack,
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
