import 'package:flutter/material.dart';
import 'package:lawyer/screens/general-question/generalquestioncomponent.dart';
import 'package:lawyer/screens/widgets/orange22text.dart';

class Generalquestion extends StatelessWidget {
  const Generalquestion({super.key});

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
