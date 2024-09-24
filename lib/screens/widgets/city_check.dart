import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyer/models/city.dart';
import 'package:lawyer/screens/search/controller/search_bloc.dart';
import 'package:lawyer/screens/widgets/black16text.dart';

class CityCeck extends StatelessWidget {
  final bool value;
  final String name;
  final City selected;

  const CityCeck({
    required this.value,
    required this.name,
    required this.selected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: (value) {
            context.read<SearchBloc>().add(
                  CityCheck(check: value, slelected: selected),
                );
          },
        ),
        Black16text(
          text: name,
        ),
      ],
    );
  }
}
