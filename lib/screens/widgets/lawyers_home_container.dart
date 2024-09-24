import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/screens/widgets/black18text.dart';

class LawyerHomeContainer extends StatelessWidget {
  final Function() ontap;
  final String image;
  final String text;

  const LawyerHomeContainer({
    super.key,
    required this.ontap,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: size.width / 1.2,
        height: size.height / 12,
        decoration: BoxDecoration(
          color: AppColor.appgray.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 5.h, right: 8.w),
              child: Black18text(
                text: text,
              ),
            ),
            Image.asset(
              height: size.height / 12,
              width: size.width / 3.8,
              image,
              fit: BoxFit.contain,
            )
          ],
        ),
      ),
    );
  }
}
