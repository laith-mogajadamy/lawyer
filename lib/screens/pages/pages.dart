import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lawyer/screens/pages/home.dart';
import 'package:lawyer/screens/pages/personalprofile.dart';

class MyPages extends StatefulWidget {
  const MyPages({Key? key}) : super(key: key);

  @override
  State<MyPages> createState() => _MyPagesState();
}

class _MyPagesState extends State<MyPages> {
  late int select = 0;
  late PageController controller;
  bool hasnet = true;

  @override
  void initState() {
    super.initState();

    controller = PageController(initialPage: select, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (select != 0) {
          controller.jumpToPage(2);
          setState(() {
            select = 0;
          });
          return false;
        } else {
          SystemNavigator.pop();
          return true;
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: PageView(
            controller: controller,
            physics: const NeverScrollableScrollPhysics(),
            children: const [Home(), PersonalProfile()],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.file_open),
              label: "Files",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: "messages",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
          currentIndex: select,
          onTap: (index) {
            setState(() {
              select = index;
            });
            controller.jumpToPage(select);
          },
          selectedItemColor: Colors.orange,
          selectedFontSize: 16.sp,
          selectedIconTheme: IconThemeData(size: 30.r, color: Colors.orange),
          showUnselectedLabels: true,
          unselectedIconTheme: IconThemeData(size: 30.r, color: Colors.grey),
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
