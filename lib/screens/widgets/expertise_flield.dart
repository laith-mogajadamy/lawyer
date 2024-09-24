import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/widgets/black18text.dart';
import 'package:lawyer/screens/widgets/expertise_input.dart';

class ExpertiseFlield extends StatelessWidget {
  final TextEditingController expertise;
  const ExpertiseFlield({
    super.key,
    required this.expertise,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<EnterBloc, EnterState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Black18text(text: S.of(context).Expertise),
            (state.expertise!.isEmpty)
                ? Column(
                    children: [
                      ExpertiseInput(
                        expertise: expertise,
                        hint: S.of(context).AddExpertise,
                        oncomplete: () {
                          context.read<EnterBloc>().add(
                                AddExpertise(expertise: expertise.text),
                              );
                          expertise.clear();
                        },
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      ExpertiseInput(
                        expertise: expertise,
                        hint: S.of(context).AddExpertise,
                        oncomplete: () {
                          context.read<EnterBloc>().add(
                                AddExpertise(expertise: expertise.text),
                              );
                          expertise.clear();
                        },
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      ExpertiseInput(
                        expertise: expertise,
                        hint: S.of(context).AddExpertise,
                        oncomplete: () {
                          context.read<EnterBloc>().add(
                                AddExpertise(expertise: expertise.text),
                              );
                          expertise.clear();
                        },
                      ),
                    ],
                  )
                : SizedBox(
                    height: size.height / 5,
                    child: ListView.builder(
                      itemCount: state.expertise!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 5.h),
                                child: Black18text(
                                  text: state.expertise![index],
                                ),
                              ),
                              (index == state.expertise!.length - 1)
                                  ? ExpertiseInput(
                                      expertise: expertise,
                                      hint: S.of(context).AddExpertise,
                                      oncomplete: () {
                                        context.read<EnterBloc>().add(
                                              AddExpertise(
                                                  expertise: expertise.text),
                                            );
                                        expertise.clear();
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
