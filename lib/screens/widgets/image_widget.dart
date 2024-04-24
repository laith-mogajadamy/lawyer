import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/services/pdf_api.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class ImageWidget extends StatelessWidget {
  final File file;

  const ImageWidget({
    super.key,
    required this.file,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Material(
          elevation: 5,
          child: Container(
              width: size.width / 2.5,
              height: size.height / 3.8,
              decoration: const BoxDecoration(
                  // color: AppColor.appgray,
                  ),
              child: Image.file(
                file,
                fit: BoxFit.cover,
              )),
        ),
      ),
    );
  }
}
