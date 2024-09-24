import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/models/lawyer.dart';
import 'package:lawyer/screens/widgets/graydivider.dart';

class RateLawyer extends StatelessWidget {
  final Lawyer lawyer;

  const RateLawyer({
    super.key,
    required this.lawyer,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColor.whiteColor,
                    radius: 75.r,
                    backgroundImage: NetworkImage(lawyer.profile),
                  ),
                  Text(
                    lawyer.name,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                        decorationColor: AppColor.apporange),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: AppColor.apporange,
                        size: 10.r,
                      ),
                      Text(
                        " ${S.of(context).location} ${lawyer.country}",
                        style: TextStyle(
                          color: AppColor.apporange,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    " ${S.of(context).closedConsultation}: ${lawyer.closedConsultation}",
                    style: TextStyle(
                      color: AppColor.apporange,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${S.of(context).consultationprice} ${lawyer.consultationPrice}",
                    style: TextStyle(
                      color: AppColor.apporange,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Graydivider(),
                ],
              ),
              Column(
                children: [
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.w),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 30.r,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(size.width / 2.3, size.height / 15),
                      backgroundColor: AppColor.offblack,
                      shape: const StadiumBorder(),
                    ),
                    child:
                        // (state.editStatus is FormSubmitting)
                        //     ? CircularProgressIndicator(
                        //         color: AppColor.whiteColor,
                        //         strokeWidth: 2.w,
                        //       )
                        //     :
                        Text(
                      S.of(context).save,
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
