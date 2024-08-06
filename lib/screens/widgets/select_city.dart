import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/widgets/black16text.dart';
import 'package:lawyer/screens/widgets/black18text.dart';

class SelectCity extends StatelessWidget {
  const SelectCity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<EnterBloc, EnterState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Black18text(text: S.of(context).City),
            SizedBox(
              height: size.height / 4,
              width: size.width,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 4,
                  crossAxisCount: 2,
                ),
                itemCount: (state.selectedcoutry.id == 1)
                    ? state.soudicitys.length
                    : state.uaecitys.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Checkbox(
                        value: (state.selectedcoutry.id == 1)
                            ? (state.soudicitys[index] == state.selectedcity)
                            : (state.uaecitys[index] == state.selectedcity),
                        onChanged: (value) {
                          context.read<EnterBloc>().add(
                                CityChanged(
                                  city: (state.selectedcoutry.id == 1)
                                      ? state.soudicitys[index]
                                      : state.uaecitys[index],
                                ),
                              );
                        },
                      ),
                      Black16text(
                        text: (state.selectedcoutry.id == 1)
                            ? state.soudicitys[index].name
                            : state.uaecitys[index].name,
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
