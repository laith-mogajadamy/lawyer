import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/screens/widgets/black10text.dart';

class HomeContainer extends StatelessWidget {
  final Function() ontap;
  final String image;
  final String text;

  const HomeContainer({
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
        width: size.width / 3.8,
        height: size.height / 8,
        decoration: BoxDecoration(
          // image: DecorationImage(
          //   fit: BoxFit.cover,
          //   image: AssetImage(
          //     image,
          //   ),
          // ),
          color: AppColor.appgray.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 2.w, top: 5.h, right: 2.w),
              child: Black10text(
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
