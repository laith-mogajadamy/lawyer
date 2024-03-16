import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/screens/chatpage.dart';
import 'package:lawyer/screens/consultation.dart';
import 'package:lawyer/screens/widgets/black18text.dart';

class Legalconsultantprofile extends StatelessWidget {
  const Legalconsultantprofile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Icon(
                size: 100.r,
                Icons.person,
                color: AppColor.apporange,
              ),
              Text(
                "LEGAL CONSULTANT'S NAME",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationThickness: 2,
                    decorationColor: AppColor.apporange),
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
                    "  LOCATION",
                    style: TextStyle(
                      color: AppColor.apporange,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                "45 CASES WON 23 FILES CLOSED",
                style: TextStyle(
                  color: AppColor.apporange,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "CONSULTATION 500AED",
                style: TextStyle(
                  color: AppColor.apporange,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    "CERTIFICATIONS & AWARDS",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height / 4,
                child: ListView.builder(
                  itemCount: 10,
                  padding: const EdgeInsets.all(8),
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Material(
                        elevation: 5,
                        child: Container(
                          width: size.width / 2,
                          decoration:
                              const BoxDecoration(color: AppColor.appgray),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Text(
                    "EXPERTISE",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Text(
                        "CONSULTAION",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: size.height / 18,
                        width: size.width / 2.5,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(size.width / 2, size.height / 20),
                            backgroundColor: Colors.orange,
                            shape: StadiumBorder(
                              side:
                                  BorderSide(color: Colors.black, width: 1.5.w),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Consultation(),
                              ),
                            );
                          },
                          child: Text(
                            "send a question",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChatPage()),
                          );
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.chat_outlined,
                              size: 60.r,
                              color: AppColor.apporange,
                            ),
                            const Black18text(text: "chat")
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
