import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/widgets/black16text.dart';
import 'package:lawyer/screens/widgets/black18text.dart';
import 'package:lawyer/screens/widgets/black22text.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: [
                Black22text(text: S.of(context).Notifications),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: BlocBuilder<EnterBloc, EnterState>(
                    builder: (context, state) {
                      return ListView.builder(
                        itemCount: state.user.unreadNotifications!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: ListTile(
                              leading: Icon(
                                Icons.notifications,
                                size: 30.r,
                                color: Colors.black,
                              ),
                              title: Black18text(
                                  text: state.user.unreadNotifications![index]
                                      .clientname),
                              subtitle: Black16text(
                                  text: state.user.unreadNotifications![index]
                                      .consultationtitle),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
