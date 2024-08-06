import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/models/lawyer.dart';
import 'package:lawyer/screens/consultation/add_consultation.dart';
import 'package:lawyer/screens/lawyers_and_translation_company/rate_lawyer.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/widgets/black18text.dart';
import 'package:lawyer/screens/widgets/graydivider.dart';
import 'package:lawyer/screens/chat/chatpage.dart';

class Legalconsultantprofile extends StatelessWidget {
  final Lawyer lawyer;

  const Legalconsultantprofile({
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
                "${S.of(context).consultationprice}${lawyer.consultationPrice}",
                style: TextStyle(
                  color: AppColor.apporange,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Row(
              //   children: [
              //     Text(
              //       S.of(context).CERTIFICATIONS,
              //       style: TextStyle(
              //         fontSize: 18.sp,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ],
              // ),
              // (lawyer.certification!.isEmpty)
              //     ? const SizedBox.shrink()
              //     : SizedBox(
              //         height: size.height / 3,
              //         child: ListView.builder(
              //           itemCount: lawyer.certification!.length,
              //           padding: const EdgeInsets.all(8),
              //           shrinkWrap: true,
              //           physics: const BouncingScrollPhysics(),
              //           scrollDirection: Axis.horizontal,
              //           itemBuilder: (context, index) {
              //             return FutureBuilder<File>(
              //               future: DefaultCacheManager()
              //                   .getSingleFile(lawyer.certification![index]),
              //               builder: (context, snapshot) => snapshot.hasData
              //                   ? PdfWidget(file: snapshot.data!)
              //                   : const SizedBox.shrink(),
              //             );
              //           },
              //         ),
              //       ),
              const Graydivider(),
              (lawyer.practices!.isNotEmpty)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).EXPERTISE,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          height: size.height / 10,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: lawyer.practices!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 5.h),
                                child: Black18text(
                                  text: lawyer.practices![index].name,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).Certifications,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: size.width,
                    height: size.height / 7,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: lawyer.certification!.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: SizedBox(
                                height: size.height / 8,
                                width: size.width / 2.5,
                                child: Image.network(
                                  lawyer.certification![index],
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: size.height / 18,
                        width: size.width / 2.5,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(size.width / 2, size.height / 20),
                            backgroundColor: AppColor.offblack,
                            shape: StadiumBorder(
                              side:
                                  BorderSide(color: Colors.black, width: 1.5.w),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddConsultation(
                                  lawyer: lawyer,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            S.of(context).sendaquestion,
                            style: TextStyle(
                              color: AppColor.whiteColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: size.height / 18,
                        width: size.width / 2.5,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(size.width / 2, size.height / 20),
                            backgroundColor: AppColor.offblack,
                            shape: StadiumBorder(
                              side:
                                  BorderSide(color: Colors.black, width: 1.5.w),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      RateLawyer(lawyer: lawyer)),
                            );
                          },
                          child: Text(
                            S.of(context).RateTheService,
                            style: TextStyle(
                              color: AppColor.whiteColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      BlocBuilder<EnterBloc, EnterState>(
                        builder: (context, state) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatPage(
                                    myself: state.user,
                                    otheruser: lawyer,
                                    token: state.token,
                                    pushertoken: state.pushertoken,
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.chat_outlined,
                                  size: 60.r,
                                  color: AppColor.offblack,
                                ),
                                Black18text(text: S.of(context).chat)
                              ],
                            ),
                          );
                        },
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
