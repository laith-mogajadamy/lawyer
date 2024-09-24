import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/general-question/general_questioncomponent.dart';
import 'package:lawyer/screens/widgets/orange22text.dart';

class Generalquestion extends StatelessWidget {
  const Generalquestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Orange22text(text: S.of(context).GeneralQuestions),
            SizedBox(
              height: 20.h,
            ),
            const Expanded(child: Generalquestioncomponent()),
          ],
        ),
      ),
    );
  }
}
