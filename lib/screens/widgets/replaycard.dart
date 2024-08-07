import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/models/general_question.dart';
import 'package:lawyer/screens/widgets/black22text.dart';
import 'package:lawyer/screens/widgets/orange22text.dart';

class Replaycard extends StatelessWidget {
  final Replies replie;
  const Replaycard({super.key, required this.replie});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30.r,
              backgroundImage: NetworkImage(replie.userResponse.profile),
            ),
            SizedBox(
              width: 15.w,
            ),
            Container(
              width: size.width / 1.4,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 245, 242, 242),
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: Colors.black, width: 2.r)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                child: SizedBox(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Orange22text(text: replie.userResponse.name),
                        Black22text(text: replie.reply),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
