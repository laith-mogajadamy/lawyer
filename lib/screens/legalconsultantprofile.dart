import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/models/lawyer.dart';
import 'package:lawyer/screens/chatpage.dart';
import 'package:lawyer/screens/consultation.dart';
import 'package:lawyer/screens/widgets/black18text.dart';

class Legalconsultantprofile extends StatelessWidget {
  final Lawyer lawyer;

  const Legalconsultantprofile({
    super.key,
    required this.lawyer,
  });

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
              CircleAvatar(
                radius: 75.r,
                backgroundImage: NetworkImage(lawyer.image),
              ),
              Text(
                lawyer.name,
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
                    " location: ${lawyer.location}",
                    style: TextStyle(
                      color: AppColor.apporange,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                " closedConsultation: ${lawyer.closedConsultation}",
                style: TextStyle(
                  color: AppColor.apporange,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "consultationPrice:${lawyer.consultationPrice}",
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
                                builder: (context) => Consultation(
                                  lawyer: lawyer,
                                ),
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
