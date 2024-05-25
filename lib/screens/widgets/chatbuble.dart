import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/services/pdf_api.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/models/message.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class ChatBubble extends StatelessWidget {
  final Message message;
  final bool? isMe;
  const ChatBubble({
    super.key,
    required this.message,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (message.attachment!.isNotEmpty) {
      if (message.attachment!.split(".").last == "pdf") {
        return Column(
          crossAxisAlignment:
              isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            FutureBuilder<File>(
                future:
                    DefaultCacheManager().getSingleFile(message.attachment!),
                builder: (context, snapshot) {
                  print("snapshot=$snapshot");
                  return (snapshot.hasData)
                      ? Padding(
                          padding: EdgeInsets.only(
                              top: 10.h,
                              bottom: 10.h,
                              left: (isMe!) ? 100.w : 5.w,
                              right: (isMe!) ? 5.w : 100.w),
                          child: GestureDetector(
                            onTap: () {
                              PDFApi().openPDF(context, snapshot.data!);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: Material(
                                elevation: 5,
                                child: Container(
                                  width: size.width / 2,
                                  decoration: const BoxDecoration(
                                    color: AppColor.appgray,
                                  ),
                                  child: PdfDocumentLoader.openFile(
                                    pageNumber: 1,
                                    snapshot.data!.path,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink();
                }),
          ],
        );
      } else {
        return Column(
          crossAxisAlignment:
              isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 10.h,
                  bottom: 10.h,
                  left: (isMe!) ? 100.w : 5.w,
                  right: (isMe!) ? 5.w : 100.w),
              child: Material(
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
            ),
          ],
        );
      }
    } else {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        padding:
            isMe! ? EdgeInsets.only(left: 40.w) : EdgeInsets.only(right: 40.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              mainAxisAlignment:
                  isMe! ? MainAxisAlignment.end : MainAxisAlignment.start,
              crossAxisAlignment:
                  isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    gradient: isMe!
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
                    borderRadius: isMe!
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
                    crossAxisAlignment: isMe!
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Text(
                        message.message!,
                        textAlign: isMe! ? TextAlign.end : TextAlign.start,
                        style: TextStyle(
                          fontSize: 16.sp,
                          decorationThickness: 2,
                          decorationColor: AppColor.apporange,
                          color: isMe! ? Colors.white : AppColor.offblack,
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
