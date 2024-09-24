import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/models/news.dart';
import 'package:lawyer/screens/lawyers_and_translation_company/lawyerscomponent.dart';
import 'package:lawyer/screens/widgets/black16text.dart';
import 'package:lawyer/screens/widgets/black18text.dart';

class ViweNewsPage extends StatelessWidget {
  final NewsM news;

  const ViweNewsPage({
    super.key,
    required this.news,
  });

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
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width,
                      ),
                      Row(
                        children: [
                          Black18text(text: S.of(context).ttitle),
                          Black18text(text: news.title),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Wrap(
                        children: [
                          Black18text(text: S.of(context).shortdescription),
                          Text(
                            news.shortDescription,
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Image.network(
                        news.img,
                        height: size.height / 5,
                        width: size.width / 2.5,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Wrap(
                        children: [
                          Black18text(text: S.of(context).description),
                          Text(
                            news.description,
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
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
