import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/pages/general_chat_page.dart';
import 'package:lawyer/screens/pages/group_massege.dart';
import 'package:lawyer/screens/the_form/contacts.dart';
import 'package:lawyer/screens/widgets/black16text.dart';

class FormPagesView extends StatelessWidget {
  const FormPagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        backgroundColor: AppColor.appgray.withOpacity(0.5),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: TabBar(
            labelPadding: EdgeInsets.symmetric(vertical: 5.h),
            dividerColor: AppColor.appgray.withOpacity(0.5),
            tabs: [
              Tab(
                child: Black16text(text: S.of(context).Groups),
              ),
              Tab(
                child: Black16text(text: S.of(context).Theforum),
              ),
              Tab(
                child: Black16text(text: S.of(context).Contacts),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            GroupMassege(),
            GeneralChatPage(),
            Contacts(),
          ],
        ),
      ),
    );
  }
}
