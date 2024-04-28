import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/services/pdf_api.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/models/lawyer.dart';
import 'package:lawyer/screens/add_consultation.dart';
import 'package:lawyer/screens/chatpage.dart';
import 'package:lawyer/screens/widgets/black18text.dart';
import 'package:lawyer/screens/widgets/graydivider.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

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
                radius: 75.r,
                backgroundImage: NetworkImage(lawyer.image),
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
                    " ${S.of(context).location} ${lawyer.location}",
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
                "${S.of(context).consultationprice}:${lawyer.consultationPrice}",
                style: TextStyle(
                  color: AppColor.apporange,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    S.of(context).CERTIFICATIONS,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              (lawyer.certification.isEmpty)
                  ? const SizedBox.shrink()
                  : SizedBox(
                      height: size.height / 3,
                      child: ListView.builder(
                        itemCount: lawyer.certification.length,
                        padding: const EdgeInsets.all(8),
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return FutureBuilder<File>(
                            future: DefaultCacheManager()
                                .getSingleFile(lawyer.certification[index]),
                            builder: (context, snapshot) => snapshot.hasData
                                ? GestureDetector(
                                    onTap: () {
                                      PDFApi().openPDF(context, snapshot.data!);
                                    },
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.w),
                                      child: Material(
                                        elevation: 5,
                                        child: Container(
                                          width: size.width / 2,
                                          decoration: const BoxDecoration(
                                              // color: AppColor.appgray,
                                              ),
                                          child: PdfDocumentLoader.openFile(
                                            pageNumber: 1,
                                            snapshot.data!.path,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          );
                        },
                      ),
                    ),
              const Graydivider(),
              Row(
                children: [
                  Text(
                    S.of(context).EXPERTISE,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Text(
                        S.of(context).Consultations,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
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
                            backgroundColor: Colors.orange,
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
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChatPage()),
                          );
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.chat_outlined,
                              size: 60.r,
                              color: AppColor.apporange,
                            ),
                            Black18text(text: S.of(context).chat)
                          ],
                        ),
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
