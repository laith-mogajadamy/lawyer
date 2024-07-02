import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/widgets/black18text.dart';

class FronteIdChange extends StatelessWidget {
  const FronteIdChange({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<EnterBloc, EnterState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            bool bottom = !state.bottom;
            context.read<EnterBloc>().add(
                  Bottomshow(bottom: bottom, destenation: "fronteid"),
                );
          },
          child: (state.feid != null)
              ? SizedBox(
                  height: size.height / 7,
                  width: size.width / 2.5,
                  child: Image.file(
                    state.feid!,
                    fit: BoxFit.cover,
                  ),
                )
              : Column(
                  children: [
                    Icon(
                      Icons.upload_file_sharp,
                      size: 70.r,
                      color: AppColor.offblack,
                    ),
                    Black18text(text: S.of(context).Front)
                  ],
                ),
        );
      },
    );
  }
}
