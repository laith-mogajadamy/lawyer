import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/screens/lawyers/typingCentercomponent.dart';
import 'package:lawyer/screens/widgets/maintextform.dart';
import 'package:lawyer/screens/widgets/orange22text.dart';

class TypingCenterpage extends StatelessWidget {
  const TypingCenterpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 30.h),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            maintextform(),
            Orange22text(text: "typing Center"),
            Expanded(child: TypingCentercomponent()),
          ],
        ),
      ),
    );
  }
}
