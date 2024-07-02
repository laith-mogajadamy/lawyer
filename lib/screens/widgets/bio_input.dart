import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/widgets/black18text.dart';

class BioInput extends StatelessWidget {
  const BioInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Black18text(text: S.of(context).Biography),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: size.width / 1.5,
              child: TextFormField(
                minLines: 2,
                maxLines: 5,
                onChanged: (value) => context.read<EnterBloc>().add(
                      BiographyChanged(biography: value),
                    ),
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.r),
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.r),
                    ),
                  ),
                  filled: true,
                  fillColor: AppColor.appgray.withOpacity(0.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
