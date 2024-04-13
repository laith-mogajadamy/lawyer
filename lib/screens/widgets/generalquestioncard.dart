import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/models/general_question.dart';
import 'package:lawyer/screens/generalquestionpage.dart';
import 'package:lawyer/screens/widgets/orange22text.dart';

class Generalquestioncard extends StatelessWidget {
  final Generalquestion genralqsttion;
  const Generalquestioncard({
    super.key,
    required this.genralqsttion,
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
                  Generalquestionpage(generalquestion: genralqsttion),
            ),
          );
        },
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundImage: NetworkImage(genralqsttion.userRequest.image),
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
                      Orange22text(text: genralqsttion.userRequest.name),
                      Text(
                        genralqsttion.question,
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
