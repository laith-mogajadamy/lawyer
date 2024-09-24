import 'package:flutter/material.dart';

class CertificationsInput extends StatelessWidget {
  final Function() ontap;
  const CertificationsInput({
    super.key,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height / 8,
      width: size.width / 4,
      child: GestureDetector(
        onTap: ontap,
        child: Image.asset(
            fit: BoxFit.contain, "assets/images/certificcation.png"),
      ),
    );
  }
}
