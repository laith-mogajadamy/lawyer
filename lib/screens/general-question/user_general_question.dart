import 'package:flutter/material.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/general-question/user_general_question_component.dart';
import 'package:lawyer/screens/widgets/orange22text.dart';

class UserGeneralquestion extends StatelessWidget {
  const UserGeneralquestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Orange22text(text: S.of(context).MyGeneralQuestions),
            const Expanded(child: UserGeneralquestioncomponent()),
          ],
        ),
      ),
    );
  }
}
