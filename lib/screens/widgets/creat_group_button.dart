import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/core/utils/formstatus.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/lawyers_and_translation_company/controller/lawyers_bloc.dart';

class CreatGroupButton extends StatelessWidget {
  const CreatGroupButton({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: BlocConsumer<LawyersBloc, LawyersState>(
        listener: (context, state) {
          if (state.creatgroupstate is SubmissionSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 2),
                content: Text(
                  state.creatgroupMessage,
                  style: TextStyle(fontSize: 14.sp, color: Colors.white),
                ),
              ),
            );
            controller.clear();
          } else if (state.creatgroupstate is SubmissionFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 2),
                content: Text(
                  state.creatgroupMessage,
                  style: TextStyle(fontSize: 14.sp, color: Colors.white),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {
              print(state.selectedlawyers);

              if ((state.creatgroupstate is FormSubmitting)) {
              } else {
                context
                    .read<LawyersBloc>()
                    .add(CreateGroup(name: controller.text));
              }

              print(state.selectedlawyers);
              print("=============");
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size(size.width / 1.5, size.height / 18),
              backgroundColor: AppColor.offblack,
              shape: const StadiumBorder(),
            ),
            child: (state.creatgroupstate is FormSubmitting)
                ? CircularProgressIndicator(
                    color: AppColor.whiteColor,
                    strokeWidth: 4.w,
                  )
                : Text(
                    S.of(context).Create,
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
          );
        },
      ),
    );
  }
}
