import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/notifications_page.dart';
import 'package:lawyer/screens/search/search.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            opacity: 0.5,
            image: AssetImage(
              "assets/images/screen.jpg",
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationsPage(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.notifications,
                    size: 30.r,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: size.height / 6,
                  child: Image.asset(
                    "assets/images/logo.png",
                  ),
                ),
                Text(
                  S.of(context).FindYourLawyer,
                  style: TextStyle(
                    fontSize: 30.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            const Expanded(child: Search()),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
