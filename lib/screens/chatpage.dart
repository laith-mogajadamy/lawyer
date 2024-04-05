import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/models/massegemodel.dart';
import 'package:lawyer/screens/widgets/chatbuble.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController messageController = TextEditingController();
  List<Message> messages = [];
  bool bottom = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: (bottom)
          ? Container(
              height: size.height / 8,
              width: size.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: AppColor.appgray,
                      blurRadius: 3.r,
                      spreadRadius: 3.r)
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                      height: size.height / 11,
                      width: size.width / 5,
                      child: SvgPicture.asset(
                        "assets/svg/gallery.svg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                      height: size.height / 11,
                      width: size.width / 5,
                      child: Image.asset(
                        "assets/images/word.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      uploadpdf();
                    },
                    child: SizedBox(
                      height: size.height / 11,
                      width: size.width / 5,
                      child: Image.asset(
                        "assets/images/icons8-acrobat-67.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : const SizedBox.shrink(),
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "BREIFCASE",
              style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                  decorationColor: AppColor.apporange),
            ),
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: messages.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  Message message = messages[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: ChatBubble(
                      type: message.type,
                      message: message.text,
                      isMe: message.isMe,
                    ),
                  );
                },
              ),
            ),
            Container(
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
                      _handleSendMessage();
                    },
                    child: Icon(
                      Icons.send,
                      size: 25.r,
                    ),
                  ),
                  prefix: InkWell(
                    onTap: () {
                      setState(() {
                        SystemChannels.textInput.invokeMethod('TextInput.hide');
                        bottom = !bottom;
                      });
                    },
                    child: Icon(
                      Icons.attachment,
                      size: 25.r,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSendMessage() {
    String messageText = messageController.text.trim();
    if (messageText.isNotEmpty) {
      Message newMessage = Message(isMe: true, text: messageText, type: "text");
      setState(() {
        messages.insert(0, newMessage);
      });
      messageController.clear();
      // You can add logic here to send the message to the other user or store it.
    }
  }

  Future uploadpdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );
    print("result= $result");
    if (result != null) {
      File file = File(result.files.single.path ?? "");
      print("file= $file");
      String filename = result.files.single.name;
      print("filename= $filename");
      String path = file.path;
      print("path= $path");
      Message newMessage = Message(isMe: true, text: filename, type: "pdf");
      setState(() {
        messages.insert(0, newMessage);
      });
    }
  }
}
