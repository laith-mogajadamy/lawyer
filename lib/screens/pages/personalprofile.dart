import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/core/utils/formstatus.dart';
import 'package:lawyer/screens/addgeneralquestion.dart';
import 'package:lawyer/screens/consultation/user_consultations.dart';
import 'package:lawyer/screens/general-question/user_general_question.dart';
import 'package:lawyer/screens/profile_edit.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/welcome/enter.dart';
import 'package:lawyer/screens/widgets/graydivider.dart';
import 'package:lawyer/screens/widgets/profile_row.dart';

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
            child: Column(
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
                Text(
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
                Text(
                  "GENDER",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "DOB  E-MAIL",
                  style: TextStyle(
                    fontSize: 14.sp,
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
                ProfileRow(
                    text: "MESSAGES", icon: Icons.mail_rounded, ontap: () {}),
                const Graydivider(),
                ProfileRow(text: "FILES", icon: Icons.folder, ontap: () {}),
                const Graydivider(),
                ProfileRow(
                    text: "CONSULTATIONS",
                    icon: Icons.file_copy_outlined,
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserConsultations()),
                      );
                    }),
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
                    return previous.formStatus != current.formStatus;
                  },
                  listener: (context, state) {
                    if (state.formStatus is SubmissionSuccess) {
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
                    } else if (state.formStatus is SubmissionFailed) {
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
