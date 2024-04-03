import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/models/general-question.dart';
import 'package:lawyer/screens/general-question/general-question.dart';
import 'package:lawyer/screens/generalquestionpage.dart';
import 'package:lawyer/screens/widgets/black22text.dart';
import 'package:lawyer/screens/widgets/orange22text.dart';

class Generalquestioncard extends StatelessWidget {
  final Generalquestion genralqsttion;
  const Generalquestioncard({
    super.key,
    required this.genralqsttion,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
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
                    color: AppColor.appgray,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: Colors.black, width: 2.r)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Orange22text(text: genralqsttion.userRequest.name),
                        Black22text(text: genralqsttion.question),
                      ],
                    ),
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
