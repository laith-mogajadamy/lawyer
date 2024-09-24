import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/general-question/frequently-questions_component.dart';
import 'package:lawyer/screens/widgets/orange22text.dart';

class FrequentlyQuestions extends StatelessWidget {
  const FrequentlyQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Orange22text(text: S.of(context).frequentlyaskedquestions),
            SizedBox(
              height: 20.h,
            ),
            const Expanded(child: FrequentlyQuestionsComponent()),
          ],
        ),
      ),
    );
  }
}
