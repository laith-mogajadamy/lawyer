import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/models/general_question.dart';
import 'package:lawyer/models/lawyer.dart';
import 'package:lawyer/screens/general-question/generalquestionpage.dart';

class UserGeneralquestioncard extends StatelessWidget {
  final Lawyer myself;

  final Generalquestion genralqsttion;
  const UserGeneralquestioncard({
    super.key,
    required this.genralqsttion,
    required this.myself,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Generalquestionpage(generalquestion: genralqsttion),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 245, 242, 242),
                borderRadius: BorderRadius.circular(20.r),
                // border: Border.all(color: Colors.black, width: 2.r),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3.r,
                    color: AppColor.appgray,
                    spreadRadius: 1.r,
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height / 10,
                        child: ListTile(
                          leading: Image.network(myself.profile),
                          title: Text(
                            myself.name,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 18.sp,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            genralqsttion.date,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 14.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                          trailing: SizedBox(
                            width: size.width / 3.2,
                            child: Row(
                              children: [
                                Text(
                                  "num.of.replies: ",
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 13.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.appgray,
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  padding: EdgeInsets.all(3.w),
                                  child: Text(
                                    genralqsttion.replies.length.toString(),
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 14.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Text(
                        genralqsttion.question,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 18.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
