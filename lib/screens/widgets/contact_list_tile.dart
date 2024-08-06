import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/models/lawyer.dart';
import 'package:lawyer/screens/chat/chatpage.dart';
import 'package:lawyer/screens/widgets/black18text.dart';

class ContactListTile extends StatefulWidget {
  final String token;
  final Lawyer myself;
  final Lawyer contact;
  final String pushertoken;

  const ContactListTile({
    super.key,
    required this.token,
    required this.myself,
    required this.contact,
    required this.pushertoken,
  });

  @override
  State<ContactListTile> createState() => _ContactListTileState();
}

class _ContactListTileState extends State<ContactListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(
              otheruser: widget.contact,
              token: widget.token,
              myself: widget.myself,
              pushertoken: widget.pushertoken,
            ),
          ),
        );
      },
      leading: (widget.contact.profile.isEmpty)
          ? Icon(
              Icons.person,
              size: 50.r,
              color: AppColor.apporange,
            )
          : CircleAvatar(
              radius: 50.r,
              backgroundColor: AppColor.whiteColor,
              child: Image.network(
                widget.contact.profile,
                fit: BoxFit.cover,
              ),
            ),
      title: Black18text(text: widget.contact.name),
    );
  }
}
