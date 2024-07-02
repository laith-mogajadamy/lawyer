import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';

class ProfileImageChange extends StatelessWidget {
  const ProfileImageChange({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EnterBloc, EnterState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            bool bottom = !state.bottom;
            context
                .read<EnterBloc>()
                .add(Bottomshow(bottom: bottom, destenation: "profileImage"));
          },
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              (state.fimage != null)
                  ? Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 3.w),
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: CircleAvatar(
                        radius: 75.r,
                        backgroundImage: FileImage(state.fimage!),
                      ),
                    )
                  : (state.user.profile != "")
                      ? Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green, width: 3.w),
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          child: CircleAvatar(
                            backgroundColor: AppColor.whiteColor,
                            radius: 75.r,
                            backgroundImage: NetworkImage(state.user.profile),
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green, width: 3.w),
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 60.r,
                            child: Icon(
                              Icons.person,
                              size: 75.r,
                              color: AppColor.appgray,
                            ),
                          ),
                        ),
              Icon(
                Icons.edit,
                size: 30.r,
              ),
            ],
          ),
        );
      },
    );
  }
}
