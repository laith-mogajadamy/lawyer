import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/models/lawyer.dart';
import 'package:lawyer/screens/chat/chatpage.dart';
import 'package:lawyer/screens/widgets/black16text.dart';
import 'package:lawyer/screens/widgets/black18text.dart';

class ContactListTile extends StatelessWidget {
  final String token;
  final Lawyer myself;
  final Lawyer contact;

  const ContactListTile({
    super.key,
    required this.token,
    required this.myself,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(
              otheruser: contact,
              token: token,
              myself: myself,
            ),
          ),
        );
      },
      leading: (contact.profile.isEmpty)
          ? Icon(
              Icons.person,
              size: 50.r,
              color: AppColor.apporange,
            )
          : CircleAvatar(
              radius: 50.r,
              backgroundImage: NetworkImage(contact.profile),
            ),
      title: Black18text(text: contact.name),
      trailing: CircleAvatar(
        radius: 12.r,
        backgroundColor: AppColor.appgray,
        child: const Black16text(text: "1"),
      ),
    );
  }
}
