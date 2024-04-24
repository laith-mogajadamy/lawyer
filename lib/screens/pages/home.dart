import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/screens/general-question/general_question.dart';
import 'package:lawyer/screens/lawyers/lawyerspage.dart';
import 'package:lawyer/screens/lawyers/legalConsultantpage.dart';
import 'package:lawyer/screens/lawyers/typingCenterpage.dart';
import 'package:lawyer/screens/widgets/black16text.dart';
import 'package:lawyer/screens/widgets/maintextform.dart';

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
      body: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: 3.h, left: 5.w, right: 5.w, bottom: 10.h),
            child: const Maintextform(),
          ),
          Column(
            children: [
              Text(
                "BRIEFCASE",
                style: TextStyle(
                  fontSize: 30.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 3.h,
                width: size.width / 2,
                color: AppColor.apporange,
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Black16text(text: "LAWYER"),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Lawyerspage()),
                      );
                    },
                    child: Container(
                      width: size.width / 2.2,
                      height: size.height / 6,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            "assets/images/lawyer.jpeg",
                          ),
                        ),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Black16text(text: "LEGAL CONSULTANT"),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LegalConsultantpage()),
                      );
                    },
                    child: Container(
                      width: size.width / 2.2,
                      height: size.height / 6,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            "assets/images/LEGAL CONSULTANT.jpeg",
                          ),
                        ),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Black16text(text: "typing Centers "),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TypingCenterpage()),
                  );
                },
                child: Container(
                  width: size.width / 1.1,
                  height: size.height / 6,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        "assets/images/Typing Center.jpg",
                      ),
                    ),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Black16text(text: "GENERAL QUESTIONS "),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Generalquestion()),
                  );
                },
                child: Container(
                  width: size.width / 1.1,
                  height: size.height / 6,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        "assets/images/Typing Center.jpg",
                      ),
                    ),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
