import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/models/notifications.dart';
import 'package:lawyer/screens/widgets/black16text.dart';
import 'package:lawyer/screens/widgets/black18text.dart';

class NotificationsCard extends StatelessWidget {
  final Notifications notification;
  const NotificationsCard({
    super.key,
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.notifications,
          size: 30.r,
          color: Colors.black,
        ),
        title: Black18text(text: notification.joineduser),
        subtitle: Black16text(text: notification.consultationtitle),
      ),
    );
  }
}
