import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/core/utils/enums.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/general-question/controller/generalquestion_bloc.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';

class AddGeneralquestionpage extends StatefulWidget {
  const AddGeneralquestionpage({
    super.key,
  });

  @override
  State<AddGeneralquestionpage> createState() => _AddGeneralquestionpageState();
}

class _AddGeneralquestionpageState extends State<AddGeneralquestionpage> {
  TextEditingController controller = TextEditingController();
  TextEditingController title = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<GeneralquestionBloc, GeneralquestionState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: ListView(
              children: [
                Center(
                  child: Text(
                    S.of(context).General_n_Question,
                    style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.apporange),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  width: size.width,
                  height: size.height / 10,
                  child: Form(
                    child: TextFormField(
                      controller: title,
                      onChanged: (string) {},
                      minLines: 2,
                      maxLines: 30,
                      enabled: true,
                      style: TextStyle(color: Colors.black, fontSize: 18.sp),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        hintText: S.of(context).ttitle,
                        hintStyle: TextStyle(
                            fontSize: 24.sp,
                            color: AppColor.apporange,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColor.apporange,
                            decorationThickness: 3,
                            decorationStyle: TextDecorationStyle.dotted),
                        filled: true,
                        fillColor: AppColor.appgray,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  width: size.width,
                  height: size.height / 3,
                  child: Form(
                    child: TextFormField(
                      controller: controller,
                      onChanged: (string) {},
                      minLines: 20,
                      maxLines: 30,
                      enabled: true,
                      style: TextStyle(color: Colors.black, fontSize: 18.sp),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        hintText: S.of(context).TypeyourGeneralquestionhere,
                        hintStyle: TextStyle(
                            fontSize: 24.sp,
                            color: AppColor.apporange,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColor.apporange,
                            decorationThickness: 3,
                            decorationStyle: TextDecorationStyle.dotted),
                        filled: true,
                        fillColor: AppColor.appgray,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  width: size.width,
                  child: Text(
                    textAlign: TextAlign.center,
                    S.of(context).YOURQUESTIONMAYORMAYNOTBEANSWERED,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColor.apporange,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColor.apporange,
                      decorationThickness: 3.h,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width / 4),
                  child:
                      BlocListener<GeneralquestionBloc, GeneralquestionState>(
                    listener: (context, state) {
                      if (state.generalquestionsState == RequestState.loaded) {
                        context.read<EnterBloc>().add(
                              Getuser(),
                            );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            duration: const Duration(seconds: 2),
                            content: Text(
                              state.generalquestionreplyMessage,
                              style: TextStyle(
                                  fontSize: 14.sp, color: Colors.white),
                            ),
                          ),
                        );
                      } else if (state.generalquestionsState ==
                          RequestState.error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            duration: const Duration(seconds: 2),
                            content: Text(
                              state.generalquestionreplyMessage,
                              style: TextStyle(
                                  fontSize: 14.sp, color: Colors.white),
                            ),
                          ),
                        );
                      }
                    },
                    child: ElevatedButton(
                      onPressed: () async {
                        if (controller.text.isNotEmpty) {
                          context.read<GeneralquestionBloc>().add(
                                AddGeneralquestion(
                                  title: title.text.trim(),
                                  question: controller.text.trim(),
                                ),
                              );
                        }
                        controller.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                          size.width / 5,
                          size.height / 15,
                        ),
                        backgroundColor: Colors.orange,
                        shape: StadiumBorder(
                          side: BorderSide(color: Colors.black, width: 1.5.w),
                        ),
                      ),
                      child: Text(
                        S.of(context).Send,
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
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
