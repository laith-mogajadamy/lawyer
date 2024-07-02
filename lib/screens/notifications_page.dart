import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/widgets/black22text.dart';
import 'package:lawyer/screens/widgets/notifications_card.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Black22text(text: S.of(context).Notifications),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: BlocBuilder<EnterBloc, EnterState>(
                  builder: (context, state) {
                    if (state.user.unreadNotifications!.isNotEmpty) {
                      return ListView.builder(
                        itemCount: state.user.unreadNotifications!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return NotificationsCard(
                            notification:
                                state.user.unreadNotifications![index],
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Black22text(
                            text: S.of(context).Youdonthaveanynotifications),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
