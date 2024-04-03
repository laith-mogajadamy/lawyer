import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/screens/general-question/generalquestioncomponent.dart';
import 'package:lawyer/screens/lawyers/lawyerscomponent.dart';
import 'package:lawyer/screens/widgets/maintextform.dart';
import 'package:lawyer/screens/widgets/orange22text.dart';

class generalquestion extends StatelessWidget {
  const generalquestion({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Orange22text(text: "General Questions"),
            Expanded(child: Generalquestioncomponent()),
          ],
        ),
      ),
    );
  }
}
