import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/models/lawyer.dart';
import 'package:lawyer/screens/LegalConsultantProfile.dart';
import 'package:lawyer/screens/widgets/black18text.dart';
import 'package:lawyer/screens/widgets/black22text.dart';

class Lawyerscard extends StatelessWidget {
  final Lawyer lawyer;

  const Lawyerscard({
    super.key,
    required this.lawyer,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Legalconsultantprofile(
                    lawyer: lawyer,
                  )),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 40.r,
                backgroundImage: NetworkImage(lawyer.image),
              ),
              SizedBox(
                width: 15.w,
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColor.appgray,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: Colors.black, width: 2.r)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  child: SizedBox(
                    height: size.height / 5,
                    width: size.width / 1.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Black22text(text: lawyer.name),
                        Row(
                          children: [
                            const Black18text(text: "numOfConsultation: "),
                            Black18text(text: "${lawyer.numOfConsultation}"),
                          ],
                        ),
                        Row(
                          children: [
                            const Black18text(text: "closedConsultation: "),
                            Black18text(text: "${lawyer.closedConsultation}"),
                          ],
                        ),
                        Row(
                          children: [
                            const Black18text(text: "yearsOfPractice: "),
                            Black18text(text: lawyer.yearsOfPractice!),
                          ],
                        ),
                        Row(
                          children: [
                            const Black18text(text: "consultationPrice: "),
                            Black18text(text: lawyer.consultationPrice!),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
