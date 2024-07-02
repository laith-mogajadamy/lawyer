import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/widgets/black18text.dart';
import 'package:lawyer/screens/widgets/expertise_input.dart';

class LanguageFlield extends StatelessWidget {
  final TextEditingController language;
  const LanguageFlield({
    super.key,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<EnterBloc, EnterState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Black18text(text: S.of(context).Languages),
            (state.languages!.isEmpty)
                ? Column(
                    children: [
                      ExpertiseInput(
                        expertise: language,
                        // hint: S.of(context).AddExpertise,
                        hint: null,
                        oncomplete: () {
                          context.read<EnterBloc>().add(
                                AddLanguage(language: language.text),
                              );
                          language.clear();
                        },
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      ExpertiseInput(
                        expertise: language,
                        // hint: S.of(context).AddExpertise,
                        hint: null,
                        oncomplete: () {
                          context.read<EnterBloc>().add(
                                AddLanguage(language: language.text),
                              );
                          language.clear();
                        },
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      ExpertiseInput(
                        expertise: language,
                        // hint: S.of(context).AddExpertise,
                        hint: null,
                        oncomplete: () {
                          context.read<EnterBloc>().add(
                                AddLanguage(language: language.text),
                              );
                          language.clear();
                        },
                      ),
                    ],
                  )
                : SizedBox(
                    height: size.height / 5,
                    child: ListView.builder(
                      itemCount: state.languages!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 5.h),
                                child: Black18text(
                                  text: state.languages![index],
                                ),
                              ),
                              (index == state.languages!.length - 1)
                                  ? ExpertiseInput(
                                      expertise: language,
                                      // hint: S.of(context).AddExpertise,
                                      hint: null,
                                      oncomplete: () {
                                        context.read<EnterBloc>().add(
                                              AddLanguage(
                                                  language: language.text),
                                            );
                                        language.clear();
                                      },
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          ),
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
