import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/enums.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/general-question/controller/generalquestion_bloc.dart';
import 'package:lawyer/screens/widgets/black22text.dart';
import 'package:lawyer/screens/widgets/generalquestioncard.dart';
import 'package:lottie/lottie.dart';

class FrequentlyQuestions extends StatelessWidget {
  const FrequentlyQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => GeneralquestionBloc()..add(GetFrequentlyQuestions()),
      child: Scaffold(
        appBar: AppBar(
          title: Black22text(text: S.of(context).frequentlyaskedquestions),
        ),
        body: BlocBuilder<GeneralquestionBloc, GeneralquestionState>(
          builder: (context, state) {
            switch (state.frequentlyquestionsState) {
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
                return ListView.builder(
                  itemCount: state.frequentlyquestions.length,
                  itemBuilder: (context, index) {
                    return Generalquestioncard(
                      genralqsttion: state.frequentlyquestions[index],
                    );
                  },
                );
              case RequestState.error:
                return SizedBox(
                  height: 280.h,
                  child: Center(
                    child: Text(state.frequentlyquestionMessage),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
