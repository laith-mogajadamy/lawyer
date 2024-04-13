import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/enums.dart';
import 'package:lawyer/models/consultation.dart';
import 'package:lawyer/screens/consultation/controller/consultation_bloc.dart';
import 'package:lawyer/screens/widgets/black18text.dart';
import 'package:lawyer/screens/widgets/question_and_title.dart';
import 'package:lawyer/screens/widgets/replay_text_field.dart';

// ignore: must_be_immutable
class ConsultationPage extends StatelessWidget {
  final Consultation consultation;
  ConsultationPage({super.key, required this.consultation});

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => ConsultationBloc(),
      child: BlocBuilder<ConsultationBloc, ConsultationState>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: ListView(
                  children: [
                    Center(
                      child: Text(
                        "Consultation",
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(child: Black18text(text: consultation.sender.name)),
                    SizedBox(
                      height: 10.h,
                    ),
                    QuestionAndTitle(
                      title:
                          "${consultation.title}\n${consultation.description}",
                    ),
                    ReplayTextField(
                      controller: controller,
                      hint: "Type your answer with details",
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width / 4),
                      child: BlocListener<ConsultationBloc, ConsultationState>(
                        listener: (context, state) {
                          if (state.consultationState == RequestState.loaded) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.green,
                                duration: const Duration(seconds: 2),
                                content: Text(
                                  state.consultationMessage,
                                  style: TextStyle(
                                      fontSize: 14.sp, color: Colors.white),
                                ),
                              ),
                            );
                          } else if (state.consultationState ==
                              RequestState.error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                duration: const Duration(seconds: 2),
                                content: Text(
                                  state.consultationMessage,
                                  style: TextStyle(
                                      fontSize: 14.sp, color: Colors.white),
                                ),
                              ),
                            );
                          }
                        },
                        child: ElevatedButton(
                          onPressed: () async {
                            context.read<ConsultationBloc>().add(
                                  Answerconsultation(
                                    id: consultation.id,
                                    answer: controller.text.trim(),
                                  ),
                                );
                            controller.clear();
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                              size.width / 5,
                              size.height / 15,
                            ),
                            backgroundColor: Colors.orange,
                            shape: StadiumBorder(
                              side:
                                  BorderSide(color: Colors.black, width: 1.5.w),
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
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
