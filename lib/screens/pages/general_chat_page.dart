import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/screens/chat/group_chat_page.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/widgets/black18text.dart';
import 'package:lawyer/screens/widgets/black22text.dart';

class GeneralChatPage extends StatelessWidget {
  const GeneralChatPage({
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
            (state.user.generalChats!.isEmpty)
                ? const Center(
                    child: Black22text(text: "You dont have General Chats"))
                : Expanded(
                    child: SizedBox(
                      child: ListView.builder(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        itemCount: state.user.generalChats!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: 5.h),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GroupChatPage(
                                      token: state.token,
                                      user: state.user,
                                      group: state.user.generalChats![index],
                                      pushertoken: state.pushertoken,
                                    ),
                                  ),
                                );
                              },
                              child: SizedBox(
                                height: size.height / 12,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.group,
                                      size: 50.r,
                                      color: AppColor.apporange,
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: AppColor.appgray,
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w, vertical: 5.h),
                                        child: Black18text(
                                            text: state.user
                                                .generalChats![index].name),
                                      ),
                                    )
                                  ],
                                ),
                              ),
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
