import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyer/screens/search/controller/search_bloc.dart';
import 'package:lawyer/screens/widgets/black16text.dart';
import 'package:lawyer/screens/widgets/graydivider.dart';

class CountryCheckWidget extends StatelessWidget {
  const CountryCheckWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: ((state.selectedcountry.id == 1) ? true : false),
                      onChanged: (value) {
                        context.read<SearchBloc>().add(
                              CountryCheck(
                                  check: value, slelected: state.coutrys[0]),
                            );
                      },
                    ),
                    Black16text(
                      text: state.coutrys[0].name,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: size.width / 2.5,
                    ),
                    Checkbox(
                      value: ((state.selectedcountry.id == 2) ? true : false),
                      onChanged: (value) {
                        context.read<SearchBloc>().add(
                              CountryCheck(
                                  check: value, slelected: state.coutrys[1]),
                            );
                      },
                    ),
                    Black16text(
                      text: state.coutrys[1].name,
                    ),
                  ],
                )
              ],
            ),
            const Graydivider(),
          ],
        );
      },
    );
  }
}
