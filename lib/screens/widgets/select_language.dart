import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/widgets/black16text.dart';
import 'package:lawyer/screens/widgets/black18text.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<EnterBloc, EnterState>(
      builder: (context, state) {
        return Column(
          children: [
            Black18text(text: S.of(context).Language),
            SizedBox(
              height: size.height / 2.8,
              width: size.width,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 4,
                  crossAxisCount: 2,
                ),
                itemCount: state.languages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Checkbox(
                        value: (state.selectedlanguages.contains(
                          state.languages[index],
                        )),
                        onChanged: (value) {
                          context.read<EnterBloc>().add(
                                CheckLanguage(
                                    check: value,
                                    slelected: state.languages[index]),
                              );
                        },
                      ),
                      Black16text(
                        text: state.languages[index].name,
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
