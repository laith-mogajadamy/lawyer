import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/models/message.dart';
import 'package:lawyer/screens/widgets/pdf_widget.dart';

class ChatBubble extends StatelessWidget {
  final Message message;

  const ChatBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (message.attachment!.isNotEmpty) {
      if (message.attachment!.split(".").last == "pdf") {
        return Column(
          crossAxisAlignment:
              message.isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            PdfWidget(file: message.file!),
          ],
        );
      } else {
        return Column(
          crossAxisAlignment:
              message.isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Material(
                elevation: 5,
                child: Container(
                  width: size.width / 2.5,
                  height: size.height / 4,
                  decoration: const BoxDecoration(
                      // color: AppColor.appgray,
                      ),
                  child: Image.network(message.attachment!),
                ),
              ),
            ),
          ],
        );
      }
    } else {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        padding: message.isMe!
            ? EdgeInsets.only(left: 40.w)
            : EdgeInsets.only(right: 40.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              mainAxisAlignment: message.isMe!
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              crossAxisAlignment: message.isMe!
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    gradient: message.isMe!
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
                    borderRadius: message.isMe!
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
                    crossAxisAlignment: message.isMe!
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Text(
                        message.message!,
                        textAlign:
                            message.isMe! ? TextAlign.end : TextAlign.start,
                        style: TextStyle(
                          decorationThickness: 2,
                          decorationColor: AppColor.apporange,
                          color: message.isMe! ? Colors.white : Colors.grey,
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
