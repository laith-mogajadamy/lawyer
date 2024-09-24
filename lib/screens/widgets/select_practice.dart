import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/widgets/black16text.dart';
import 'package:lawyer/screens/widgets/black18text.dart';

class SelectPractice extends StatelessWidget {
  const SelectPractice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<EnterBloc, EnterState>(
      builder: (context, state) {
        return Column(
          children: [
            Black18text(text: S.of(context).Practice),
            SizedBox(
              height: size.height / 5,
              width: size.width,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 4,
                  crossAxisCount: 2,
                ),
                itemCount: state.practices.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Checkbox(
                        value: (state.selectedpractices.contains(
                          state.practices[index],
                        )),
                        onChanged: (value) {
                          context.read<EnterBloc>().add(
                                CheckPractice(
                                    check: value,
                                    slelected: state.practices[index]),
                              );
                        },
                      ),
                      Black16text(
                        text: state.practices[index].name,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
