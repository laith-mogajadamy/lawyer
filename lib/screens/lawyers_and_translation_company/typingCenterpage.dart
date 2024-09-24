import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/lawyers_and_translation_company/typingCentercomponent.dart';
import 'package:lawyer/screens/widgets/maintextform.dart';
import 'package:lawyer/screens/widgets/orange22text.dart';

class TypingCenterpage extends StatelessWidget {
  const TypingCenterpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Maintextform(),
            Orange22text(text: S.of(context).typingCenter),
            const Expanded(child: TypingCentercomponent()),
          ],
        ),
      ),
    );
  }
}
