import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/models/city.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/widgets/black16text.dart';
import 'package:lawyer/screens/widgets/black18text.dart';

class SelectCountry extends StatelessWidget {
  const SelectCountry({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<EnterBloc, EnterState>(
      builder: (context, state) {
        List<DropdownMenuItem<City>> dropdownlist = [];
        for (var i = 0; i < state.coutrys.length; i++) {
          dropdownlist.add(
            DropdownMenuItem(
              value: state.coutrys[i],
              child: Black16text(text: state.coutrys[i].name),
            ),
          );
        }
        return SizedBox(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Black18text(text: S.of(context).Country),
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
                        hint: Black16text(text: S.of(context).Country),
                        items: dropdownlist,
                        value: (state.selectedcoutry ==
                                const City(id: 0, name: ''))
                            ? null
                            : state.selectedcoutry,
                        onChanged: (value) {
                          context.read<EnterBloc>().add(
                                CountryChanged(
                                  country: value,
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
// GridView.builder(
//                 shrinkWrap: true,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   childAspectRatio: 4,
//                   crossAxisCount: 2,
//                 ),
//                 itemCount: state.coutrys.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Row(
//                     children: [
//                       Checkbox(
//                         value: (state.coutrys[index] == state.selectedcoutry),
//                         onChanged: (value) {
//                           context.read<EnterBloc>().add(
//                                 CountryChanged(
//                                   country: state.coutrys[index],
//                                 ),
//                               );
//                         },
//                       ),
//                       Black16text(
//                         text: state.coutrys[index].name,
//                       ),
//                     ],
//                   );
//                 },
//               ),