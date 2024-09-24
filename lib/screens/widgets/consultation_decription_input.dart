import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/generated/l10n.dart';

class ConsultationDecriptionInput extends StatelessWidget {
  const ConsultationDecriptionInput({
    super.key,
    required this.description,
  });

  final TextEditingController description;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: description,
      minLines: 10,
      maxLines: 30,
      style: TextStyle(color: Colors.black, fontSize: 18.sp),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        hintText: S.of(context).Typeyourquestionwithdetails,
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
    );
  }
}
