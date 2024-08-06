import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/core/utils/enums.dart';
import 'package:lawyer/screens/search/controller/search_bloc.dart';
import 'package:lawyer/screens/search/search_filter.dart';
import 'package:lawyer/screens/widgets/lawyercard.dart';
import 'package:lottie/lottie.dart';

class Searchcomponent extends StatelessWidget {
  const Searchcomponent({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    bool bottom = false;

    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        switch (state.searchState) {
          case RequestState.loading:
            return SizedBox(
              height: size.height / 3,
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
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.h),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                margin: EdgeInsets.symmetric(vertical: 10.h),
                decoration: BoxDecoration(
                  color: AppColor.appgray.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 5.h),
                          child: SizedBox(
                            width: size.width / 8,
                            child: GestureDetector(
                              onTap: () {
                                bottom = !state.bottom;
                                print("bottom$bottom");
                                context.read<SearchBloc>().add(
                                      Bottomshow(bottom: bottom),
                                    );
                                if (bottom) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                }
                              },
                              child: Image.asset("assets/images/sliders.png"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    (state.bottom)
                        ? const SearchFilter()
                        : Expanded(
                            child: SizedBox(
                              child: ListView.builder(
                                itemCount: state.lawyers.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Lawyerscard(
                                    lawyer: state.lawyers[index],
                                  );
                                },
                              ),
                            ),
                          )
                  ],
                ),
              ),
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
    );
  }
}
