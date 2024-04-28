import 'package:flutter/material.dart';
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
            Orange22text(text: S.of(context).GeneralQuestions),
            const Expanded(child: Generalquestioncomponent()),
          ],
        ),
      ),
    );
  }
}
