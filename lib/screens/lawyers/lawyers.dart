import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/screens/lawyers/lawyerscomponent.dart';
import 'package:lawyer/screens/widgets/maintextform.dart';

class Lawyers extends StatelessWidget {
  const Lawyers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 30.h),
        child: const Column(
          children: [
            maintextform(),
            Expanded(child: Lawyerscomponent()),
          ],
        ),
      ),
    );
  }
}
