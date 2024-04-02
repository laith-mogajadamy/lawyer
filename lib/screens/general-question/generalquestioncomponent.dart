import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/core/utils/enums.dart';
import 'package:lawyer/screens/general-question/controller/generalquestion_bloc.dart';
import 'package:lawyer/screens/general-question/general-question.dart';
import 'package:lawyer/screens/lawyers/controller/lawyers_bloc.dart';
import 'package:lawyer/screens/widgets/black18text.dart';
import 'package:lawyer/screens/widgets/black22text.dart';
import 'package:lawyer/screens/widgets/lawyercard.dart';
import 'package:lottie/lottie.dart';

class Generalquestioncomponent extends StatefulWidget {
  const Generalquestioncomponent({super.key});

  @override
  State<Generalquestioncomponent> createState() => _FilesPageState();
}

class _FilesPageState extends State<Generalquestioncomponent> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => GeneralquestionBloc()..add(GetGeneralquestion()),
      child: BlocBuilder<GeneralquestionBloc, GeneralquestionState>(
        builder: (context, state) {
          switch (state.generalquestionsState) {
            case RequestState.loading:
              return SizedBox(
                height: size.height / 1.5,
                child: Container(
                  alignment: Alignment.center,
                  child: Center(
                    child: Lottie.asset('assets/lottie/waiting.json',
                        fit: BoxFit.fill, height: 250.h),
                  ),
                ),
              );
            case RequestState.loaded:
              return Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: ListView.builder(
                        itemCount: state.generalquestions.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: 5.h),
                            child: SizedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 30.r,
                                    backgroundImage: NetworkImage(state
                                        .generalquestions[index]
                                        .userRequest
                                        .image),
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: AppColor.appgray,
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                        border: Border.all(
                                            color: Colors.black, width: 2.r)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 5.h),
                                      child: SizedBox(
                                        height: size.height / 8,
                                        width: size.width / 1.8,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Black22text(
                                                text: state
                                                    .generalquestions[index]
                                                    .question),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              );
            case RequestState.error:
              return SizedBox(
                height: 280.h,
                child: Center(
                  child: Text(state.generalquestionMessage),
                ),
              );
          }
        },
      ),
    );
  }
}
