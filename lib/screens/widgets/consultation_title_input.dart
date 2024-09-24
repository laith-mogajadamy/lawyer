import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/generated/l10n.dart';

class ConsultationTitleInput extends StatelessWidget {
  const ConsultationTitleInput({
    super.key,
    required this.title,
  });

  final TextEditingController title;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: title,
      minLines: 1,
      maxLines: 3,
      style: TextStyle(color: Colors.black, fontSize: 18.sp),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        hintText: S.of(context).Typeyourquestiontilte,
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
