import 'package:flutter/material.dart';
import 'package:lawyer/screens/consultation/user_consultations_component.dart';
import 'package:lawyer/screens/widgets/orange22text.dart';

class UserConsultations extends StatelessWidget {
  const UserConsultations({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Orange22text(text: " My consultations"),
            Expanded(child: UserConsultationscomponent()),
          ],
        ),
      ),
    );
  }
}
