import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/enums.dart';
import 'package:lawyer/screens/search/controller/search_bloc.dart';
import 'package:lawyer/screens/widgets/lawyercard.dart';
import 'package:lottie/lottie.dart';

class Searchcomponent extends StatelessWidget {
  const Searchcomponent({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => SearchBloc(),
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          switch (state.searchState) {
            case RequestState.loading:
              return SizedBox(
                height: size.height / 1.5,
                child: Container(
                    alignment: Alignment.center,
                    child: Center(
                      child: Lottie.asset(
                        'assets/lottie/searching.json',
                        fit: BoxFit.cover,
                        height: 250.h,
                      ),
                    )),
              );
            case RequestState.loaded:
              return Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: ListView.builder(
                        itemCount: state.lawyers.length,
                        itemBuilder: (context, index) {
                          return Lawyerscard(
                            lawyer: state.lawyers[index],
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
                  child: Text(state.lawyersMessage),
                ),
              );
          }
        },
      ),
    );
  }
}
