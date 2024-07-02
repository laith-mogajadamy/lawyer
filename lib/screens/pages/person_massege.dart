import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/widgets/black22text.dart';
import 'package:lawyer/screens/widgets/contact_list_tile.dart';
import 'package:lawyer/screens/widgets/graydivider.dart';

class PersonMassege extends StatelessWidget {
  const PersonMassege({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

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
                      child: Black22text(text: "You dont have messages"))
                  : Expanded(
                      child: SizedBox(
                        child: ListView.builder(
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          itemCount: state.contacts.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0.w, vertical: 5.h),
                              child: Column(
                                children: [
                                  ContactListTile(
                                    token: state.token,
                                    contact: state.contacts[index],
                                    myself: state.user,
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