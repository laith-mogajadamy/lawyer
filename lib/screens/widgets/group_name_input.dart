import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/generated/l10n.dart';

class GroupNameInput extends StatelessWidget {
  const GroupNameInput({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height / 18,
      width: size.width / 2.2,
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: Colors.black, fontSize: 18.sp),
        cursorColor: Colors.black,
        decoration: InputDecoration(
            suffix: Icon(
              Icons.edit_outlined,
              color: AppColor.offblack,
              size: 30.r,
            ),
            hintText: S.of(context).groupname,
            hintStyle: TextStyle(color: Colors.black45, fontSize: 16.sp),
            border: UnderlineInputBorder(
              borderSide: BorderSide(width: 3.h, color: Colors.black),
            )
            // border: UnderlineInputBorder(),
            ),
      ),
    );
  }
}
