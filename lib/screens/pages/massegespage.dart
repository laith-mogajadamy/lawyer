import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/chat/controller/chat_bloc.dart';
import 'package:lawyer/screens/pages/general_chat_page.dart';
import 'package:lawyer/screens/pages/group_massege.dart';
import 'package:lawyer/screens/widgets/black16text.dart';
import 'package:lawyer/screens/widgets/black22text.dart';

class MassegesPage extends StatefulWidget {
  const MassegesPage({super.key});

  @override
  State<MassegesPage> createState() => _MassegesPageState();
}

class _MassegesPageState extends State<MassegesPage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    // TextEditingController textcontroller = TextEditingController();
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leadingWidth: 0,
          automaticallyImplyLeading: false,
          leading: null,
          actions: null,
          backgroundColor: AppColor.appgray,
          bottom: TabBar(
            tabs: [
              Tab(
                child: Black16text(text: S.of(context).Persons),
              ),
              Tab(
                child: Black16text(text: S.of(context).Groups),
              ),
              Tab(
                child: Black16text(text: S.of(context).generalchat),
              ),
            ],
          ),
          title: Black22text(text: S.of(context).chat),
          // title: TextFormField(
          //   onChanged: (string) {
          //     setState(() {});
          //   },
          //   controller: textcontroller,
          //   enabled: true,
          //   style: TextStyle(color: Colors.black, fontSize: 18.sp),
          //   decoration: InputDecoration(
          //       focusedBorder: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(20.r),
          //       ),
          //       hintText: S.of(context).search,
          //       hintStyle: const TextStyle(color: Colors.black),
          //       filled: true,
          //       fillColor: AppColor.appgray,
          //       prefixIcon: InkWell(
          //         onTap: () {},
          //         child: Icon(
          //           Icons.search,
          //           size: 33.sp,
          //           color: Colors.black,
          //         ),
          //       ),
          //       border: UnderlineInputBorder(
          //           borderSide: BorderSide(color: Colors.black, width: 2.h))),
          // ),
        ),
        body: const SafeArea(
          child: TabBarView(
            children: [
              // PersonMassege(),
              GroupMassege(),
              GeneralChatPage(),
            ],
          ),
        ),
      ),
    );
  }
}
