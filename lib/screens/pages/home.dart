import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/screens/widgets/black20text.dart';
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
            child: const maintextform(),
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
                  Container(
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
                ],
              ),
              Column(
                children: [
                  const Black16text(text: "LEGAL CONSULTANT"),
                  Container(
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
              const Black16text(text: "Typing Center"),
              Container(
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
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Black16text(text: "ADS"),
              Container(
                width: size.width / 1.1,
                height: size.height / 6,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "assets/images/ADS.jpg",
                    ),
                  ),
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
            child: Row(
              children: [
                Container(
                  width: size.width / 3,
                  height: size.height / 13,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        "assets/images/output-onlinepngtools.png",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
