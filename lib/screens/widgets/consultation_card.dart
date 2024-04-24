import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/models/consultation.dart';
import 'package:lawyer/screens/consultation_page.dart';

class ConsultationCard extends StatelessWidget {
  final Consultation consultation;
  const ConsultationCard({
    super.key,
    required this.consultation,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ConsultationPage(consultation: consultation),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 245, 242, 242),
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
                      leading: SizedBox(
                          width: size.width / 6,
                          child: Image.network(consultation.sender.image)),
                      title: Text(
                        consultation.sender.name,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 18.sp,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        consultation.createdOn,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 14.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      trailing: SizedBox(
                        width: size.width / 7,
                        height: size.height / 20,
                        child: (consultation.status == 1)
                            ? Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Center(
                                  child: Text("Ongoing",
                                      style: TextStyle(fontSize: 12.sp)),
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Center(
                                    child: Text(
                                  "Closed",
                                  style: TextStyle(fontSize: 12.sp),
                                )),
                              ),
                      ),
                    ),
                  ),
                  Text(
                    consultation.title,
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
    );
  }
}
