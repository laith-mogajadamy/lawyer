import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/models/consultation.dart';
import 'package:lawyer/screens/consultation_page.dart';
import 'package:lawyer/screens/widgets/orange22text.dart';

class ConsultationCard extends StatelessWidget {
  final Consultation consultation;
  const ConsultationCard({
    super.key,
    required this.consultation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ConsultationPage(consultation: consultation),
            ),
          );
        },
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundImage: NetworkImage(consultation.sender.image),
              ),
              SizedBox(
                width: 15.w,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 239, 239, 239),
                  borderRadius: BorderRadius.circular(20.r),
                  // border: Border.all(color: Colors.black, width: 2.r),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3.r,
                      color: AppColor.appgray,
                      spreadRadius: 1.r,
                    )
                  ],
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Orange22text(text: consultation.sender.name),
                      Text(
                        consultation.title,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 22.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
