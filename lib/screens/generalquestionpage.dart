import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/core/utils/enums.dart';
import 'package:lawyer/models/general-question.dart';
import 'package:lawyer/screens/general-question/controller/generalquestion_bloc.dart';
import 'package:lawyer/screens/widgets/black18text.dart';
import 'package:lawyer/screens/widgets/black22text.dart';
import 'package:lawyer/screens/widgets/replaycard.dart';

class Generalquestionpage extends StatefulWidget {
  final Generalquestion generalquestion;
  const Generalquestionpage({super.key, required this.generalquestion});

  @override
  State<Generalquestionpage> createState() => _GeneralquestionpageState();
}

class _GeneralquestionpageState extends State<Generalquestionpage> {
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => GeneralquestionBloc(),
      child: BlocBuilder<GeneralquestionBloc, GeneralquestionState>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: ListView(
                children: [
                  Center(
                    child: Text(
                      "General Question",
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                      child: Black18text(
                          text: widget.generalquestion.userRequest.name)),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: SizedBox(
                      width: size.width,
                      child: Container(
                          decoration: BoxDecoration(
                              color: AppColor.appgray,
                              borderRadius: BorderRadius.circular(20.r),
                              border:
                                  Border.all(color: Colors.black, width: 1.r)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            child: Black22text(
                                text: widget.generalquestion.question),
                          )),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    width: size.width,
                    height: size.height / 3,
                    child: Form(
                      child: TextFormField(
                        controller: controller,
                        onChanged: (string) {
                          // bloc.add(GetSearchProductsEvent(
                          //     pageNum: 1, search: string, perPage: 100));
                        },
                        minLines: 20,
                        maxLines: 30,
                        enabled: true,
                        style: TextStyle(color: Colors.black, fontSize: 18.sp),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          hintText: "TYPE YOUR replay",
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
                      "by answering more general question you will get higher chances to be at the top of the search result",
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
                        if (state.generalquestionsState ==
                            RequestState.loaded) {
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
                                  ReplayGeneralquestion(
                                    id: widget.generalquestion.id,
                                    replay: controller.text.trim(),
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
                          " send",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 2.h,
                  ),
                  const Center(child: Black22text(text: "replayes")),
                  SizedBox(
                    height: 10.h,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.generalquestion.replies.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Replaycard(
                        replie: widget.generalquestion.replies[index],
                      );
                    },
                  ),
                ],
              ),
            )),
          );
        },
      ),
    );
  }
}
