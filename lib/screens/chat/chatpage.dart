// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
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
import 'package:lawyer/models/lawyermodel.dart';
import 'package:lawyer/models/message.dart';
import 'package:lawyer/models/messagemodel.dart';
import 'package:lawyer/screens/chat/controller/chat_bloc.dart';
import 'package:lawyer/screens/chat/data/chatrequest.dart';
import 'package:lawyer/screens/widgets/black18text.dart';
import 'package:lawyer/screens/widgets/chat_text_field.dart';
import 'package:lawyer/screens/widgets/chatbuble.dart';
import 'package:lawyer/screens/widgets/group_chat_buble.dart';
import 'package:lottie/lottie.dart';
import 'package:pusher_client/pusher_client.dart';

class ChatPage extends StatefulWidget {
  final Lawyer myself;

  final Lawyer otheruser;
  final String token;
  final String pushertoken;

  const ChatPage({
    super.key,
    required this.myself,
    required this.otheruser,
    required this.token,
    required this.pushertoken,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController messageController = TextEditingController();
  bool bottom = false;
  File? pfile;
  late Channel receiverchannel;
  late Channel senderchannel;

  late PusherClient pusher;
  List<Message> messages = [];

  StreamController<Message> messagesstream =
      StreamController<Message>.broadcast();
  addoldmessages() async {
    Response response;

    print(widget.token);
    print(widget.otheruser.id);

    response = await GetMessagesInChat.getmessages(
        //we need an id for the group
        widget.otheruser.id,
        widget.token);
    List<Message> hmessages = List<MessageModel>.from(
      (response.data['data'] as List).map(
        (e) => MessageModel.fromJson(e),
      ),
    );
    print(response);
    (hmessages.isNotEmpty)
        ? messagesstream.sink.add(hmessages[0])
        : messagesstream.sink.add(
            Message(
              isMe: false,
              message: "this is the first message",
              type: '',
              file: File(''),
              attachment: '',
              sender: LawyerModel.fromJson(
                {},
              ),
              receiver: LawyerModel.fromJson(
                {},
              ),
            ),
          );
    messages.addAll(hmessages.reversed);
  }

  pusherinit() async {
    await addoldmessages();

    print(widget.pushertoken);
    try {
      pusher = PusherClient(
        "21c93d7ae9ded5a63591",
        PusherOptions(
          wsPort: 6001,
          cluster: 'ap2',
          // encrypted: false,
          auth: PusherAuth(
            "https://main.briefcaseplatform.com/api/pusher/auth",
            headers: {
              "Accept": "application/json",
              "Content-type": "application/json",
              "Authorization": widget.pushertoken,
            },
          ),
        ),
        // autoConnect: true,
        // enableLogging: true,
      );
      await pusher.connect();
      print("===========");

      print(pusher.getSocketId());
    } catch (e) {
      print(e);
    }

    receiverchannel =
        pusher.subscribe("private-chat-channel-${widget.myself.id}");
    senderchannel =
        pusher.subscribe("private-chat-channel-${widget.otheruser.id}");
    print(receiverchannel.name);

    // channel.trigger('chatMessage', jsonEncode({"message": "hi"}));
    await receiverchannel.bind('chatMessage', (event) async {
      if (event!.data != null) {
        var jsonData = jsonDecode(event.data!);
        print(event.data);
        Message message = Message(
          isMe: (jsonData['sender_id'] == widget.myself.id) ? true : false,
          message: jsonData['message'],
          type: "",
          file: File(""),
          attachment: jsonData['attachment']?["url"] ?? "",
          sender: widget.otheruser,
          receiver: LawyerModel.fromJson(
            jsonData['receiver'] ?? {},
          ),
        );

        messagesstream.sink.add(message);
        messages.insert(0, message);
      }
    });
    // await senderchannel.bind('chatMessage', (event) async {
    //   if (event!.data != null) {
    //     var jsonData = jsonDecode(event.data!);
    //     print(event.data);
    //     Message message = Message(
    //       isMe: (jsonData['sender_id'] == widget.myself!.id) ? true : false,
    //       message: jsonData['message'],
    //       type: "",
    //       file: File(""),
    //       attachment: jsonData['attachment'],
    //       sender: null,
    //       receiver: LawyerModel.fromJson(
    //         jsonData['receiver'] ?? {},
    //       ),
    //     );

    //     messagesstream.sink.add(message);
    //     messages.insert(0, message);
    //   } else {}
    // });
  }

  disactive() async {
    await receiverchannel.unbind('chatMessage');
    await senderchannel.unbind('chatMessage');
    await pusher.unsubscribe("chat-channel-${widget.otheruser.id}");
    await pusher.unsubscribe("chat-channel-${widget.myself.id}");
    pusher.disconnect();
    messagesstream.close();
    messageController.dispose();
  }

  @override
  void initState() {
    pusherinit();
    super.initState();
  }

  @override
  void dispose() {
    disactive();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        sendattachment() {
          if (pfile != null) {
            print(pfile);

            context.read<ChatBloc>().add(SendMessageInChatEvent(
                attachment: pfile, message: null, id: widget.otheruser.id));
          }
          print("************************");
          print(bottom);
          bottom = !bottom;
          context.read<ChatBloc>().add(
                Bottomshow(
                  bottom: bottom,
                ),
              );
          Message message = Message(
              isMe: true,
              message: null,
              type: pfile!.path.split(".").last,
              file: pfile,
              attachment: null,
              sender: widget.myself,
              receiver: widget.otheruser);
          messages.insert(0, message);
          messagesstream.sink.add(message);
          pfile = null;
        }

        print("111111111111");
        print(
          widget.otheruser.profile,
        );
        return Scaffold(
          appBar: AppBar(
            leadingWidth: size.width / 4,
            backgroundColor: AppColor.appgray,
            title: Black18text(text: widget.otheruser.name),
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
                  backgroundColor: AppColor.whiteColor,
                  radius: 25.r,
                  backgroundImage: NetworkImage(
                    widget.otheruser.profile,
                  ),
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: StreamBuilder(
                    stream: messagesstream.stream,
                    builder: (BuildContext context,
                        AsyncSnapshot<Message> asyncSnapshot) {
                      if (asyncSnapshot.hasError) {
                        return const Text("Error");
                      }
                      if (asyncSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(
                          child: LottieBuilder.asset(
                            "assets/lottie/waiting.json",
                            height: size.height / 3,
                            fit: BoxFit.cover,
                          ),
                        );
                      }

                      print(messages);
                      return ListView.builder(
                        reverse: true,
                        itemCount: messages.length,
                        shrinkWrap: true,
                        dragStartBehavior: DragStartBehavior.down,
                        itemBuilder: (BuildContext context, int index) {
                          Message message = messages[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: GroupChatBubble(
                              isMe: (message.sender != null)
                                  ? (message.sender!.id == widget.myself.id)
                                      ? true
                                      : false
                                  : message.isMe!,
                              message: message,
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    await pickimage(ImageSource.gallery);
                                    sendattachment();
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
                                    sendattachment();
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
                    ChatTextField(
                        myself: widget.myself,
                        messageController: messageController,
                        otheruser: widget.otheruser,
                        messages: messages,
                        messagesstream: messagesstream),
                  ],
                ),
              ],
            ),
          ),
        );
      },
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
      final image =
          await ImagePicker().pickImage(source: source, imageQuality: 100);
      if (image == null) {
        return null;
      }
      File file = File(image.path);
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
