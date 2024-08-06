import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyer/models/language.dart';
import 'package:lawyer/screens/search/controller/search_bloc.dart';
import 'package:lawyer/screens/widgets/black16text.dart';

class LanguageCheck extends StatelessWidget {
  final bool value;
  final String name;
  final Language selected;

  const LanguageCheck({
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
                  CheckLanguage(check: value, slelected: selected),
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
