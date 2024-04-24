import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/services/pdf_api.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/core/utils/formstatus.dart';
import 'package:lawyer/screens/addgeneralquestion.dart';
import 'package:lawyer/screens/consultation/user_consultations.dart';
import 'package:lawyer/screens/general-question/user_general_question.dart';
import 'package:lawyer/screens/profile_edit.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/welcome/enter.dart';
import 'package:lawyer/screens/widgets/black18text.dart';
import 'package:lawyer/screens/widgets/graydivider.dart';
import 'package:lawyer/screens/widgets/profile_row.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class PersonalProfile extends StatelessWidget {
  const PersonalProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<EnterBloc, EnterState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: ListView(
              children: [
                (state.user.image.isEmpty)
                    ? Icon(
                        size: 100.r,
                        Icons.person,
                        color: AppColor.apporange,
                      )
                    : CircleAvatar(
                        radius: 75.r,
                        backgroundImage: NetworkImage(state.user.image),
                      ),
                Center(
                  child: Text(
                    (state.user.name.isNotEmpty)
                        ? state.user.name
                        : "CLIENT'S NAME",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                        decorationColor: AppColor.apporange),
                  ),
                ),
                Center(
                  child: Text(
                    "GENDER",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "DOB  E-MAIL",
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
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
                      " CURRENT LOCATION",
                      style: TextStyle(
                        color: AppColor.apporange,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "CERTIFICATIONS",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                (state.user.certification.isEmpty)
                    ? const SizedBox.shrink()
                    : SizedBox(
                        height: size.height / 3,
                        child: ListView.builder(
                          itemCount: state.user.certification.length,
                          padding: const EdgeInsets.all(8),
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return FutureBuilder<File>(
                                future: DefaultCacheManager().getSingleFile(
                                    state.user.certification[index]),
                                builder: (context, snapshot) {
                                  print("snapshot=$snapshot");
                                  return (snapshot.hasData)
                                      ? GestureDetector(
                                          onTap: () {
                                            PDFApi().openPDF(
                                                context, snapshot.data!);
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.w),
                                            child: Material(
                                              elevation: 5,
                                              child: Container(
                                                width: size.width / 2,
                                                decoration: const BoxDecoration(
                                                  color: AppColor.appgray,
                                                ),
                                                child:
                                                    PdfDocumentLoader.openFile(
                                                  pageNumber: 1,
                                                  snapshot.data!.path,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : const SizedBox.shrink();
                                });
                          },
                        ),
                      ),
                const Graydivider(),
                ProfileRow(
                  text: "GENERALQUESTIONS",
                  icon: Icons.quiz_rounded,
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserGeneralquestion()),
                    );
                  },
                ),
                const Graydivider(),
                ProfileRow(
                  text: "POST A GENERAL QUESTION",
                  icon: Icons.quiz,
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddGeneralquestionpage()),
                    );
                  },
                ),
                const Graydivider(),
                ProfileRow(
                  text: "Profile Edit",
                  icon: Icons.edit_note_rounded,
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileEdit()),
                    );
                  },
                ),
                const Graydivider(),
                BlocListener<EnterBloc, EnterState>(
                  listenWhen: (previous, current) {
                    return previous.logoutStatus != current.logoutStatus;
                  },
                  listener: (context, state) {
                    if (state.logoutStatus is FormSubmitting) {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            backgroundColor: AppColor.whiteColor,
                            elevation: 5,
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Black18text(text: "Logging out...."),
                                SizedBox(
                                  height: 10.h,
                                ),
                                CircularProgressIndicator(
                                  color: AppColor.apporange,
                                  strokeWidth: 8.w,
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else if (state.logoutStatus is SubmissionSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green,
                          duration: const Duration(seconds: 2),
                          content: Text(
                            state.message,
                            style:
                                TextStyle(fontSize: 14.sp, color: Colors.white),
                          ),
                        ),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Enter()),
                      );
                    } else if (state.logoutStatus is SubmissionFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          duration: const Duration(seconds: 2),
                          content: Text(
                            state.message,
                            style:
                                TextStyle(fontSize: 14.sp, color: Colors.white),
                          ),
                        ),
                      );
                    }
                  },
                  child: ProfileRow(
                    text: "LOG OUT",
                    icon: Icons.exit_to_app_rounded,
                    ontap: () {
                      context.read<EnterBloc>().add(
                            Logout(token: state.token),
                          );
                    },
                  ),
                ),
              ],
            ),
          )),
        );
      },
    );
  }
}
