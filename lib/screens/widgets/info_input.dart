import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/screens/widgets/black22text.dart';

// ignore: must_be_immutable
class InfoInput extends StatelessWidget {
  final String name;
  final String hint;
  final String? Function(String?)? validator;
  final Function(String?)? onchange;
  final TextEditingController controller;

  const InfoInput({
    super.key,
    required this.name,
    required this.hint,
    required this.validator,
    required this.onchange,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(child: Black22text(text: name)),
        SizedBox(
          width: size.width / 2,
          child: TextFormField(
            controller: controller,
            validator: validator,
            onChanged: onchange,
            style: TextStyle(color: Colors.black, fontSize: 18.sp),
            cursorColor: Colors.black,
            decoration: InputDecoration(
              fillColor: const Color.fromARGB(255, 253, 242, 150),
              filled: true,
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey, fontSize: 16.sp),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(
                  30.r,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
