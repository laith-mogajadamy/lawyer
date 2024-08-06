import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/models/lawyer.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/widgets/black16text.dart';
import 'package:lawyer/screens/widgets/black22text.dart';
import 'package:lawyer/screens/widgets/contact_list_tile.dart';
import 'package:lawyer/screens/widgets/graydivider.dart';
import 'package:pusher_client/pusher_client.dart';

class PersonMassege extends StatefulWidget {
  final Lawyer myself;
  final String pushertoken;

  final String token;

  const PersonMassege({
    super.key,
    required this.myself,
    required this.token,
    required this.pushertoken,
  });

  @override
  State<PersonMassege> createState() => _PersonMassegeState();
}

class _PersonMassegeState extends State<PersonMassege> {
  late Channel receiverchannel;
  late PusherClient pusher;
  StreamController<int> counterstream = StreamController<int>.broadcast();
  pusherinit() async {
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
        pusher.subscribe("private-counter-chat-channel-${widget.myself.id}");

    print(receiverchannel.name);

//get the event name

    await receiverchannel.bind('counterChat', (event) async {
      if (event!.data != null) {
        var jsonData = jsonDecode(event.data!);
        print("data==========");
        print(event.data);
        int counter = int.parse(
          //get the data name
          (jsonData['Message_count']),
        );

        counterstream.sink.add(counter);
      } else {}
    });
  }

  disactive() async {
    await receiverchannel.unbind('CounterChat');
    await pusher
        .unsubscribe("private-counter-chat-channel-${widget.myself.id}");
    pusher.disconnect();
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appgray,
        title: Black22text(text: S.of(context).chat),
        centerTitle: true,
      ),
      body: BlocBuilder<EnterBloc, EnterState>(
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              (state.contacts.isEmpty)
                  ? const Center(
                      child: Black22text(text: "You dont have messages"),
                    )
                  : Expanded(
                      child: SizedBox(
                        child: ListView.builder(
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          itemCount: state.contacts.length,
                          itemBuilder: (context, index) {
                            Channel senderchanel = pusher.subscribe(
                                "private-counter-chat-channel-${state.contacts[index].id}");
                            print(senderchanel.name);
                            senderchanel.bind('counterChat', (event) async {
                              if (event!.data != null) {
                                var jsonData = jsonDecode(event.data!);
                                print("data==========");
                                print(event.data);
                                int counter = int.parse(
                                  //get the data name
                                  (jsonData['Message_count']),
                                );

                                counterstream.sink.add(counter);
                              } else {}
                            });
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0.w, vertical: 5.h),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        width: size.width / 1.2,
                                        child: ContactListTile(
                                          token: state.token,
                                          contact: state.contacts[index],
                                          myself: state.user,
                                          pushertoken: state.pushertoken,
                                        ),
                                      ),
                                      StreamBuilder(
                                        stream: counterstream.stream,
                                        builder: (BuildContext context,
                                            AsyncSnapshot<int> asyncSnapshot) {
                                          if (asyncSnapshot.hasError) {
                                            return const Text("Error");
                                          }
                                          // if (asyncSnapshot.connectionState == ConnectionState.waiting) {
                                          //   return Center(
                                          //     child: LottieBuilder.asset(
                                          //       "assets/lottie/waiting.json",
                                          //       height: size.height / 3,
                                          //       fit: BoxFit.cover,
                                          //     ),
                                          //   );
                                          // }
                                          print("/////////");
                                          print(asyncSnapshot.data);
                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15.w),
                                            child: CircleAvatar(
                                              radius: 14.r,
                                              backgroundColor: AppColor.appgray,
                                              child: Black16text(
                                                  text: asyncSnapshot.data
                                                      .toString()),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.h),
                                    child: const Graydivider(),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    )
            ],
          );
        },
      ),
    );
  }
}

// InkWell(
//                         // onTap: () {
//                         //   Navigator.pushReplacement(
//                         //     context,
//                         //     MaterialPageRoute(
//                         //         builder: (context) => const ChatPage()),
//                         //   );
//                         // },
//                         child: SizedBox(
//                           height: size.height / 12,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               (state.user.senderMessage![index].sender!.image
//                                       .isEmpty)
//                                   ? Icon(
//                                       Icons.person,
//                                       size: 50.r,
//                                       color: AppColor.apporange,
//                                     )
//                                   : CircleAvatar(
//                                       radius: 50.r,
//                                       backgroundImage: NetworkImage(state.user
//                                           .senderMessage![index].sender!.image),
//                                     ),
//                               SizedBox(
//                                 width: 15.w,
//                               ),
//                               Container(
//                                 decoration: BoxDecoration(
//                                     color: AppColor.appgray,
//                                     borderRadius: BorderRadius.circular(30)),
//                                 child: Padding(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 10.w, vertical: 5.h),
//                                   child: Black18text(
//                                       text: state.user.senderMessage![index]
//                                           .sender!.name),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),