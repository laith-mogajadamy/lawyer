import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/models/massegemodel.dart';
import 'package:lawyer/screens/widgets/chatbuble.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  List<Message> messages = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
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
                controller: _messageController,
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
                    onTap: () {},
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
    String messageText = _messageController.text.trim();
    if (messageText.isNotEmpty) {
      Message newMessage = Message(isMe: true, text: messageText);
      setState(() {
        messages.insert(0, newMessage);
      });
      _messageController.clear();
      // You can add logic here to send the message to the other user or store it.
    }
  }
}
