import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';

class CheckAvailablewidget extends StatelessWidget {
  const CheckAvailablewidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EnterBloc, EnterState>(
      builder: (context, state) {
        return Row(
          children: [
            Checkbox(
              value: state.available,
              onChanged: (check) {
                context.read<EnterBloc>().add(
                      CheckAvailable(available: check),
                    );
              },
            ),
            Text(
              S.of(context).Available,
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
          ],
        );
      },
    );
  }
}
