import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/lawyers_and_translation_company/translation_company_component.dart';

class TranslationCompanys extends StatelessWidget {
  const TranslationCompanys({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            opacity: 0.5,
            image: AssetImage(
              "assets/images/screen.jpg",
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Column(
              children: [
                SizedBox(
                  height: size.height / 6,
                  child: Image.asset(
                    "assets/images/logo.png",
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Container(
                height: size.height / 1.4,
                decoration: BoxDecoration(
                  color: AppColor.appgray.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Text(
                        S.of(context).translationcompany,
                        style: TextStyle(
                            color: AppColor.appburnet,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Expanded(
                      child: TranslationCompanysComponent(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
          ],
        ),
      ),
    );
  }
}
