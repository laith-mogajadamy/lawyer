import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/models/lawyer.dart';
import 'package:lawyer/models/message.dart';
import 'package:lawyer/models/messagemodel.dart';
import 'package:lawyer/screens/chat/controller/chat_bloc.dart';
import 'package:lawyer/screens/chat/data/chatrequest.dart';
import 'package:lawyer/screens/widgets/black18text.dart';
import 'package:lawyer/screens/widgets/chatbuble.dart';

class ChatPage extends StatefulWidget {
  final Lawyer? user;
  final String token;
  const ChatPage({
    super.key,
    required this.user,
    required this.token,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController messageController = TextEditingController();
  bool bottom = false;
  File? pfile;
  StreamController<List<Message>> streamController =
      StreamController.broadcast(sync: true);

  addStreamData() async {
    while (true) {
      await Future.delayed(
        const Duration(seconds: 3),
      );
      Response response = await GetMessagesInChat.getmessages(
        widget.user!.id,
        widget.token,
      );
      List<Message> messages = List<MessageModel>.from(
        (response.data['data'] as List).map(
          (e) => MessageModel.fromJson(e),
        ),
      );
      streamController.sink.add(messages);
    }
  }

  // Stream<List<Message>> messagesStream() async* {
  //   print(widget.user.id);

  //   print(widget.token);

  //   await Future.delayed(
  //     const Duration(seconds: 1),
  //   );
  //   Response response = await GetMessagesInChat.getmessages(
  //     widget.user.id,
  //     widget.token,
  //   );
  //   List<Message> messages = List<MessageModel>.from(
  //     (response.data['data'] as List).map(
  //       (e) => MessageModel.fromJson(e),
  //     ),
  //   );
  //   print("yielded messages= ${messages}");
  //   yield messages;
  // }

  @override
  void initState() {
    // messagesStream().listen((event) {
    //   print("listening");
    //   event.length;
    //   print(event);
    //   print(messagesStream());
    //   return;
    // });
    addStreamData();

    super.initState();
  }

  @override
  void dispose() {
    messageController.dispose();
    streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => ChatBloc(),
      child: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leadingWidth: size.width / 4,
              backgroundColor: AppColor.appgray,
              title: Black18text(text: widget.user!.name),
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30.r,
                    ),
                  ),
                  CircleAvatar(
                    radius: 25.r,
                    backgroundImage: NetworkImage(widget.user!.image),
                  ),
                ],
              ),
            ),
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
                    child: StreamBuilder(
                      stream: streamController.stream,
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Message>> asyncSnapshot) {
                        if (asyncSnapshot.hasError) {
                          return const Text("Error");
                        }
                        if (asyncSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container();
                        }
                        List<Message> messages =
                            asyncSnapshot.data!.reversed.toList();
                        return ListView.builder(
                          reverse: true,
                          itemCount: messages.length,
                          shrinkWrap: true,
                          dragStartBehavior: DragStartBehavior.down,
                          itemBuilder: (BuildContext context, int index) {
                            Message message = messages[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: ChatBubble(
                                file: message.file,
                                message: message.text,
                                type: '',
                                isMe: (message.sender!.id == widget.user!.id)
                                    ? false
                                    : true,
                                attachment: message.attachment,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Column(
                    children: [
                      (state.bottom)
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.r)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      await pickimage(ImageSource.gallery);
                                      if (pfile != null) {
                                        print(pfile);
                                        if (mounted) {
                                          context.read<ChatBloc>().add(
                                              SendMessageInChatEvent(
                                                  attachment: pfile,
                                                  message: pfile!.path
                                                      .split("/")
                                                      .last,
                                                  id: widget.user!.id));
                                        }
                                      }
                                      print("************************");

                                      print(bottom);

                                      bottom = !bottom;
                                      context.read<ChatBloc>().add(
                                            Bottomshow(
                                              bottom: bottom,
                                            ),
                                          );
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
                                    onTap: () async {
                                      await pickpdf();
                                      if (pfile != null) {
                                        print(pfile);
                                        if (mounted) {
                                          context.read<ChatBloc>().add(
                                              SendMessageInChatEvent(
                                                  attachment: pfile,
                                                  message: pfile!.path
                                                      .split("/")
                                                      .last,
                                                  id: widget.user!.id));
                                        }
                                      }
                                      print("************************");

                                      print(bottom);

                                      bottom = !bottom;
                                      context.read<ChatBloc>().add(
                                            Bottomshow(
                                              bottom: bottom,
                                            ),
                                          );
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
                        margin: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 10.h),
                        height: size.height / 14,
                        width: size.width / 1,
                        child: TextFormField(
                          autofocus: true,
                          onChanged: (string) {},
                          controller: messageController,
                          enabled: true,
                          style:
                              TextStyle(color: Colors.black, fontSize: 18.sp),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.h, color: Colors.black),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.h, color: Colors.black),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            hintStyle: const TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: AppColor.appgray,
                            suffix: InkWell(
                              onTap: () {
                                String messageText =
                                    messageController.text.trim();
                                if (messageText.isNotEmpty) {
                                  context.read<ChatBloc>().add(
                                        SendMessageInChatEvent(
                                            attachment: null,
                                            message: messageText,
                                            id: widget.user!.id),
                                      );
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
                                bottom = !bottom;
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  pickpdf() async {
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
      pfile = file;
      return file;
    } else {
      return null;
    }
  }

  pickimage(ImageSource source) async {
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
      pfile = file;
      return file;
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