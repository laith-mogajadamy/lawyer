import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/enums.dart';
import 'package:lawyer/screens/lawyers_and_translation_company/controller/lawyers_bloc.dart';
import 'package:lawyer/screens/widgets/lawyercard.dart';
import 'package:lottie/lottie.dart';

class TranslationCompanysComponent extends StatelessWidget {
  const TranslationCompanysComponent({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => LawyersBloc()..add(Getlawyers()),
      child: BlocBuilder<LawyersBloc, LawyersState>(
        builder: (context, state) {
          switch (state.translationCompanysState) {
            case RequestState.loading:
              return SizedBox(
                height: size.height / 1.5,
                child: Container(
                  alignment: Alignment.center,
                  child: Center(
                    child: Lottie.asset('assets/lottie/waiting.json',
                        fit: BoxFit.fill, height: 250.h),
                  ),
                ),
              );
            case RequestState.loaded:
              return Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: ListView.builder(
                        itemCount: state.translationCompanys.length,
                        itemBuilder: (context, index) {
                          return Lawyerscard(
                            lawyer: state.translationCompanys[index],
                          );
                        },
                      ),
                    ),
                  )
                ],
              );
            case RequestState.error:
              return SizedBox(
                height: 280.h,
                child: Center(
                  child: Text(state.translationCompanysMessage),
                ),
              );
          }
        },
      ),
    );
  }
}
