import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/enums.dart';
import 'package:lawyer/screens/general-question/controller/generalquestion_bloc.dart';
import 'package:lawyer/screens/widgets/generalquestioncard.dart';
import 'package:lottie/lottie.dart';

class Generalquestioncomponent extends StatefulWidget {
  const Generalquestioncomponent({super.key});

  @override
  State<Generalquestioncomponent> createState() =>
      _GeneralquestioncomponentState();
}

class _GeneralquestioncomponentState extends State<Generalquestioncomponent> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => GeneralquestionBloc()..add(GetGeneralquestion()),
      child: BlocBuilder<GeneralquestionBloc, GeneralquestionState>(
        builder: (context, state) {
          switch (state.generalquestionsState) {
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
                itemCount: state.generalquestions.length,
                itemBuilder: (context, index) {
                  return Generalquestioncard(
                    genralqsttion: state.generalquestions[index],
                  );
                },
              );
            case RequestState.error:
              return SizedBox(
                height: 280.h,
                child: Center(
                  child: Text(state.generalquestionMessage),
                ),
              );
          }
        },
      ),
    );
  }
}
