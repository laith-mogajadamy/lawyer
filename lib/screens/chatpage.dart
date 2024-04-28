import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
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
                      file: message.file,
                      type: message.type,
                      message: message.text,
                      isMe: message.isMe,
                    ),
                  );
                },
              ),
            ),
            Column(
              children: [
                (bottom)
                    ? Container(
                        height: size.height / 10,
                        width: size.width,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: AppColor.appgray,
                                blurRadius: 3.r,
                                spreadRadius: 3.r)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20.r)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                pickimage(ImageSource.gallery);
                              },
                              child: SizedBox(
                                height: size.height / 15,
                                width: size.width / 8,
                                child: SvgPicture.asset(
                                  "assets/svg/gallery.svg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // GestureDetector(
                            //   onTap: () {},
                            //   child: SizedBox(
                            //     height: size.height / 15,
                            //     width: size.width / 8,
                            //     child: Image.asset(
                            //       "assets/images/word.png",
                            //       fit: BoxFit.cover,
                            //     ),
                            //   ),
                            // ),
                            GestureDetector(
                              onTap: () {
                                uploadpdf();
                              },
                              child: SizedBox(
                                height: size.height / 15,
                                width: size.width / 8,
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
                            SystemChannels.textInput
                                .invokeMethod('TextInput.hide');
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
          ],
        ),
      ),
    );
  }

  void _handleSendMessage() {
    String messageText = messageController.text.trim();
    if (messageText.isNotEmpty) {
      Message newMessage =
          Message(isMe: true, text: messageText, type: "text", file: null);
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
      allowedExtensions: ['pdf'],
    );
    print("result= $result");
    if (result != null) {
      File file = File(result.files.single.path ?? "");
      print("file= $file");
      String filename = result.files.single.name;
      print("filename= $filename");
      String path = file.path;
      print("path= $path");
      Message newMessage =
          Message(isMe: true, text: filename, type: "pdf", file: file);
      setState(() {
        messages.insert(0, newMessage);
      });
    }
  }

  Future pickimage(ImageSource source) async {
    try {
      final Image =
          await ImagePicker().pickImage(source: source, imageQuality: 100);
      if (Image == null) {
        return null;
      }
      File file = File(Image.path);
      print("file= $file");
      String filename = file.path.split("/").last;
      print("filename= $filename");
      String path = file.path;
      print("path= $path");
      Message newMessage =
          Message(isMe: true, text: filename, type: "img", file: file);
      setState(() {
        messages.insert(0, newMessage);
      });
    } on PlatformException catch (e) {
      print("failed to pick image $e");
    }
  }
}
// import 'package:flutter/material.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

// class ChatPage extends StatefulWidget {
//   @override
//   _ChatPageState createState() => _ChatPageState();
// }

// class _ChatPageState extends State<ChatPage> {
//   IO.Socket socket;
//   List<String> messages = [];

//   @override
//   void initState() {
//     super.initState();
//     // Create Socket.IO instance and connect
//     socket = IO.io('your_socket_server_url');
//     socket.connect();

//     // Listen for 'message' event
//     socket.on('message', (data) {
//       setState(() {
//         messages.add(data.toString());
//       });
//     });
//   }

//   @override
//   void dispose() {
//     // Close the connection when the page is disposed
//     socket.close();
//     super.dispose();
//   }

//   void sendMessage(String message) {
//     // Emit 'message' event
//     socket.emit('message', message);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat Page'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: messages.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(messages[index]),
//                 );
//               },
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.all(10),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     onChanged: (value) {
//                       // Update the message text
//                     },
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: () {
//                     // Send the message
//                     sendMessage('message text');
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// to add message history


// List<String> messageHistory = prefs.getStringList('messageHistory') ?? [];
// socket.on('message', (data) {
//   setState(() {
//     messages.add(data.toString());
//     messageHistory.add(data.toString());
//     prefs.setStringList('messageHistory', messageHistory);
//   });
// });