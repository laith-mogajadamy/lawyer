import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpertiseInput extends StatelessWidget {
  final TextEditingController expertise;
  final String hint;
  final Function() oncomplete;
  const ExpertiseInput({
    super.key,
    required this.expertise,
    required this.oncomplete,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height / 18,
      width: size.width / 1.5,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(
            Icons.circle_outlined,
            color: Colors.black,
            size: 20.r,
            weight: 5,
          ),
          SizedBox(
            width: 5.w,
          ),
          SizedBox(
            height: size.height / 18,
            width: size.width / 2,
            child: TextFormField(
              controller: expertise,
              onEditingComplete: oncomplete,
              style: TextStyle(color: Colors.black, fontSize: 18.sp),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  // hintText: hint,
                  hintStyle: TextStyle(color: Colors.black45, fontSize: 16.sp),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(width: 3.h, color: Colors.black))
                  // border: UnderlineInputBorder(),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
