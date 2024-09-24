import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/consultation/user_consultations_component.dart';
import 'package:lawyer/screens/widgets/orange22text.dart';

class UserConsultations extends StatelessWidget {
  const UserConsultations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 10.h, left: 5.w, right: 5.w, bottom: 10.h),
              child: Orange22text(text: S.of(context).Myconsultations),
            ),
            const Expanded(child: UserConsultationscomponent()),
          ],
        ),
      ),
    );
  }
}
