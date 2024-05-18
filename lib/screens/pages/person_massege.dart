import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/screens/chat/chatpage.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/widgets/black12text.dart';
import 'package:lawyer/screens/widgets/black18text.dart';

class PersonMassege extends StatelessWidget {
  const PersonMassege({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<EnterBloc, EnterState>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            (state.user.receiverMessage!.isEmpty)
                ? Container()
                : Expanded(
                    child: SizedBox(
                      child: ListView.builder(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        itemCount: state.user.receiverMessage!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 0.w, vertical: 5.h),
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChatPage(
                                      user: state
                                          .user.receiverMessage![index].sender,
                                      token: state.token,
                                    ),
                                  ),
                                );
                              },
                              leading: (state.user.receiverMessage![index]
                                      .sender!.image.isEmpty)
                                  ? Icon(
                                      Icons.person,
                                      size: 50.r,
                                      color: AppColor.apporange,
                                    )
                                  : CircleAvatar(
                                      radius: 50.r,
                                      backgroundImage: NetworkImage(state
                                          .user
                                          .receiverMessage![index]
                                          .sender!
                                          .image),
                                    ),
                              title: Black18text(
                                  text: state.user.receiverMessage![index]
                                      .sender!.name),
                              subtitle: Black11text(
                                  text:
                                      state.user.receiverMessage![index].text),
                            ),
                          );
                        },
                      ),
                    ),
                  )
          ],
        );
      },
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