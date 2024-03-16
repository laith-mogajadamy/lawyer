import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';

class Lawyercard extends StatelessWidget {
  const Lawyercard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      child: Row(
        children: [
          Icon(
            size: 75.r,
            Icons.person_2_sharp,
            color: AppColor.apporange,
          ),
          Container(
            child: SizedBox(
              height: size.height / 6,
              width: size.width / 1.5,
            ),
            decoration: BoxDecoration(
                color: AppColor.appgray,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: Colors.black, width: 2.r)),
          )
        ],
      ),
    );
  }
}
