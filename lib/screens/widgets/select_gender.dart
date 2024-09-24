import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/models/city.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/widgets/black16text.dart';
import 'package:lawyer/screens/widgets/black18text.dart';

class SelectGender extends StatelessWidget {
  const SelectGender({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<EnterBloc, EnterState>(
      builder: (context, state) {
        List<DropdownMenuItem<City>> dropdownlist = [];
        for (var i = 0; i < state.genders.length; i++) {
          dropdownlist.add(
            DropdownMenuItem(
              value: state.genders[i],
              child: Black16text(text: state.genders[i].name),
            ),
          );
        }
        return SizedBox(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Black18text(text: S.of(context).Gender),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: SizedBox(
                  height: size.height / 15,
                  width: size.width / 1.5,
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColor.whiteColor,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(blurRadius: 3.r, color: AppColor.offblack)
                        ]),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                      child: DropdownButton<City>(
                        underline: const SizedBox.shrink(),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        alignment: AlignmentDirectional.topCenter,
                        iconSize: 30.r,
                        isExpanded: true,
                        dropdownColor: AppColor.whiteColor,
                        borderRadius: BorderRadius.circular(20.r),
                        hint: Black16text(text: S.of(context).Gender),
                        items: dropdownlist,
                        value: (state.selectedgender ==
                                const City(id: 0, name: ''))
                            ? null
                            : state.selectedgender,
                        onChanged: (value) {
                          context.read<EnterBloc>().add(
                                GenderChanged(
                                  gender: value,
                                ),
                              );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
