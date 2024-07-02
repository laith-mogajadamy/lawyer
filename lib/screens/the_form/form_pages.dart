import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/screens/the_form/form_pages_view.dart';

class FormPages extends StatelessWidget {
  const FormPages({super.key});

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
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(25.r)),
                child: SizedBox(
                  height: size.height / 1.4,
                  child: const FormPagesView(),
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
