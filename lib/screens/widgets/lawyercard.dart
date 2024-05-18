import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/models/lawyer.dart';
import 'package:lawyer/screens/LegalConsultantProfile.dart';
import 'package:lawyer/screens/widgets/black12text.dart';
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
          child: Container(
            decoration: BoxDecoration(
                color: AppColor.appgray.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: Colors.black, width: 2.r)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              child: SizedBox(
                height: size.height / 10,
                width: size.width / 2.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20.r,
                          backgroundImage: NetworkImage(lawyer.image),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Black18text(text: lawyer.name),
                      ],
                    ),
                    Row(
                      children: [
                        Black11text(
                            text: "${S.of(context).numOfConsultation}: "),
                        Black11text(text: "${lawyer.numOfConsultation}"),
                      ],
                    ),
                    Row(
                      children: [
                        Black11text(
                            text: "${S.of(context).closedConsultation}: "),
                        Black11text(text: "${lawyer.closedConsultation}"),
                      ],
                    ),
                    Row(
                      children: [
                        Black11text(text: "${S.of(context).yearsOfPractice}: "),
                        Black11text(text: "${lawyer.yearsOfPractice}"),
                      ],
                    ),
                    Row(
                      children: [
                        Black11text(
                            text: "${S.of(context).consultationprice}: "),
                        Black11text(text: "${lawyer.consultationPrice!}"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
