import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/screens/widgets/black22text.dart';

class QuestionAndTitle extends StatelessWidget {
  final String title;
  const QuestionAndTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: SizedBox(
        width: size.width,
        child: Container(
          decoration: BoxDecoration(
              color: AppColor.appgray,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: Colors.black, width: 1.r)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Center(
              child: Black22text(text: title),
            ),
          ),
        ),
      ),
    );
  }
}
