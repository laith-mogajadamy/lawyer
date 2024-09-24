import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/models/lawyer.dart';
import 'package:lawyer/screens/lawyers_and_translation_company/legalconsultantprofile.dart';
import 'package:lawyer/screens/widgets/black12text.dart';
import 'package:lawyer/screens/widgets/black18text.dart';

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
            ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        child: SizedBox(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
            child: SizedBox(
              height: size.height / 9,
              width: size.width / 1.5,
              child: Row(
                children: [
                  SizedBox(
                    height: size.height / 12,
                    width: size.width / 6,
                    child: Image.network(
                      lawyer.profile,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Black18text(text: lawyer.name),
                      // Row(
                      //   children: [
                      //     Black12text(
                      //         text: "${S.of(context).numOfConsultation}: "),
                      //     Black12text(text: "${lawyer.numOfConsultation}"),
                      //   ],
                      // ),
                      // Row(
                      //   children: [
                      //     Black10text(
                      //         text: "${S.of(context).closedConsultation}: "),
                      //     Black10text(text: "${lawyer.closedConsultation}"),
                      //   ],
                      // ),
                      Row(
                        children: [
                          Black12text(
                              text: "${S.of(context).yearsOfPractice}: "),
                          Black12text(text: "${lawyer.yearsOfPractice}"),
                        ],
                      ),
                      Row(
                        children: [
                          Black12text(text: "${S.of(context).Expertise} "),
                          SizedBox(
                            height: size.height / 40,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: lawyer.practices!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Black12text(
                                    text: "${lawyer.practices![index].name} ");
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Black12text(
                              text: "${S.of(context).consultationprice} "),
                          Black12text(text: "${lawyer.consultationPrice!} AED"),
                        ],
                      ),
                    ],
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
