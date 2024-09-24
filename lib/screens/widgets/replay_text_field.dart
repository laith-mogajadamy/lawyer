import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';

class ReplayTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  const ReplayTextField({
    super.key,
    required this.controller,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      width: size.width,
      height: size.height / 3,
      child: TextFormField(
        controller: controller,
        onChanged: (string) {},
        minLines: 20,
        maxLines: 30,
        enabled: true,
        style: TextStyle(color: Colors.black, fontSize: 18.sp),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          hintText: hint,
          hintStyle: TextStyle(
              fontSize: 24.sp,
              color: AppColor.apporange,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationColor: AppColor.apporange,
              decorationThickness: 3,
              decorationStyle: TextDecorationStyle.dotted),
          filled: true,
          fillColor: AppColor.appgray,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
      ),
    );
  }
}
