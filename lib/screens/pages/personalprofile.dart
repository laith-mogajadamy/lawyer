import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';

class PersonalProfile extends StatelessWidget {
  const PersonalProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Icon(
            size: 100.r,
            Icons.person_2_sharp,
            color: AppColor.apporange,
          ),
          Text(
            "CLIENT'S NAME",
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationThickness: 2,
                decorationColor: AppColor.apporange),
          ),
          Text(
            "GENDER",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "DOB  E-MAIL",
            style: TextStyle(
              fontSize: 14.sp,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                color: AppColor.apporange,
                size: 10.r,
              ),
              Text(
                " CURRENT LOCATION",
                style: TextStyle(
                  color: AppColor.apporange,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.mail_rounded,
                color: AppColor.apporange,
                size: size.width / 8,
              ),
              SizedBox(
                width: 20.w,
              ),
              Text(
                "MESSAGES",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: const Divider(
              color: AppColor.appgray,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.folder,
                color: AppColor.apporange,
                size: size.width / 8,
              ),
              SizedBox(
                width: 20.w,
              ),
              Text(
                "FILES",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: const Divider(
              color: AppColor.appgray,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.file_copy_outlined,
                color: AppColor.apporange,
                size: size.width / 8,
              ),
              SizedBox(
                width: 20.w,
              ),
              Text(
                "CONSULTATIONS",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: const Divider(
              color: AppColor.appgray,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.quiz,
                color: AppColor.apporange,
                size: size.width / 8,
              ),
              SizedBox(
                width: 20.w,
              ),
              Text(
                "POST A GENERAL QUESTION",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: const Divider(
              color: AppColor.appgray,
            ),
          ),
        ],
      )),
    );
  }
}
