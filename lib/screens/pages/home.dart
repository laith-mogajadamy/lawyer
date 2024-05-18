import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/generated/l10n.dart';
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
                  onPressed: () {},
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
                      "assets/images/WhatsApp_Image_2024-04-22_at_9.43.05_AM-removebg-preview.webp"),
                ),
                Text(
                  S.of(context).FindTheRightLegalConsultation,
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
 // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Column(
            //       children: [
            //         Black16text(text: S.of(context).Lawyers),
            //         GestureDetector(
            //           onTap: () {
            //             Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => const Lawyerspage()),
            //             );
            //           },
            //           child: Container(
            //             width: size.width / 2.2,
            //             height: size.height / 6,
            //             decoration: BoxDecoration(
            //               image: const DecorationImage(
            //                 fit: BoxFit.fill,
            //                 image: AssetImage(
            //                   "assets/images/lawyer.jpeg",
            //                 ),
            //               ),
            //               borderRadius: BorderRadius.circular(20.r),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //     Column(
            //       children: [
            //         Black16text(text: S.of(context).LegalConsultant),
            //         GestureDetector(
            //           onTap: () {
            //             Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => const LegalConsultantpage()),
            //             );
            //           },
            //           child: Container(
            //             width: size.width / 2.2,
            //             height: size.height / 6,
            //             decoration: BoxDecoration(
            //               image: const DecorationImage(
            //                 fit: BoxFit.fill,
            //                 image: AssetImage(
            //                   "assets/images/LEGAL CONSULTANT.jpeg",
            //                 ),
            //               ),
            //               borderRadius: BorderRadius.circular(20.r),
            //             ),
            //           ),
            //         )
            //       ],
            //     )
            //   ],
            // ),
            // SizedBox(
            //   height: 10.h,
            // ),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Black16text(text: S.of(context).typingCenter),
            //     GestureDetector(
            //       onTap: () {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => const TypingCenterpage()),
            //         );
            //       },
            //       child: Container(
            //         width: size.width / 1.1,
            //         height: size.height / 6,
            //         decoration: BoxDecoration(
            //           image: const DecorationImage(
            //             fit: BoxFit.fill,
            //             image: AssetImage(
            //               "assets/images/Typing Center.jpg",
            //             ),
            //           ),
            //           borderRadius: BorderRadius.circular(20.r),
            //         ),
            //       ),
            //     )
            //   ],
            // ),
            // SizedBox(
            //   height: 10.h,
            // ),