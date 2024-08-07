import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/core/utils/enums.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/search/controller/search_bloc.dart';
import 'package:lawyer/screens/widgets/city_check.dart';
import 'package:lawyer/screens/widgets/country_check_widget.dart';
import 'package:lawyer/screens/widgets/language_check.dart';
import 'package:lawyer/screens/widgets/practice_check.dart';
import 'package:lawyer/screens/widgets/white15text.dart';
import 'package:lottie/lottie.dart';

class SearchFilter extends StatefulWidget {
  const SearchFilter({
    super.key,
  });

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height / 2.5,
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          switch (state.searchfiltersState) {
            case RequestState.loading:
              return SizedBox(
                height: size.height / 3,
                child: Container(
                    alignment: Alignment.center,
                    child: Center(
                      child: Lottie.asset(
                        'assets/lottie/waiting.json',
                        fit: BoxFit.cover,
                        height: 250.h,
                      ),
                    )),
              );
            case RequestState.loaded:
              return Column(
                children: [
                  SizedBox(
                    height: size.height / 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.h),
                          child: ElevatedButton(
                            onPressed: () {
                              context.read<SearchBloc>().add(
                                    ChangeFilterType(filtertype: "location"),
                                  );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.offblack,
                              shape: const BeveledRectangleBorder(),
                            ),
                            child: White15text(text: S.of(context).location),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.h),
                          child: ElevatedButton(
                            onPressed: () {
                              context.read<SearchBloc>().add(
                                    ChangeFilterType(filtertype: "Practice"),
                                  );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.offblack,
                              shape: const BeveledRectangleBorder(),
                            ),
                            child: White15text(text: S.of(context).Practice),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.h),
                          child: ElevatedButton(
                            onPressed: () {
                              context.read<SearchBloc>().add(
                                    ChangeFilterType(filtertype: "language"),
                                  );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.offblack,
                              shape: const BeveledRectangleBorder(),
                            ),
                            child: White15text(text: S.of(context).Language),
                          ),
                        ),
                      ],
                    ),
                  ),
                  (state.filtertype == "location")
                      ? const CountryCheckWidget()
                      : const SizedBox.shrink(),
                  Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 4,
                        crossAxisCount: 2,
                      ),
                      itemCount: (state.filtertype == "location")
                          ? (state.selectedcountry.id == "1")
                              ? state.soudicitys.length
                              : state.uaecitys.length
                          : (state.filtertype == "Practice")
                              ? state.practices.length
                              : state.languages.length,
                      itemBuilder: (BuildContext context, int index) {
                        print(state.selectedcitys);

                        return (state.filtertype == "location")
                            ? (state.selectedcountry.id == 1)
                                ? CityCeck(
                                    value: (state.selectedcitys.contains(
                                      state.soudicitys[index],
                                    )),
                                    name: state.soudicitys[index].name,
                                    selected: state.soudicitys[index],
                                  )
                                : CityCeck(
                                    value: (state.selectedcitys.contains(
                                      state.uaecitys[index],
                                    )),
                                    name: state.uaecitys[index].name,
                                    selected: state.uaecitys[index],
                                  )
                            : (state.filtertype == "Practice")
                                ? PracticeCheck(
                                    value: (state.selectedpractices.contains(
                                      state.practices[index],
                                    )),
                                    name: state.practices[index].name,
                                    selected: state.practices[index],
                                  )
                                : LanguageCheck(
                                    value: (state.selectedlanguages.contains(
                                      state.languages[index],
                                    )),
                                    name: state.languages[index].name,
                                    selected: state.languages[index],
                                  );
                      },
                    ),
                  ),
                  BlocBuilder<SearchBloc, SearchState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          bool bottom = !state.bottom;
                          print("bottom$bottom");
                          context.read<SearchBloc>().add(
                                Bottomshow(bottom: bottom),
                              );
                          context.read<SearchBloc>().add(
                                Searchlawyers(),
                              );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 68, 68, 68),
                          shape: const BeveledRectangleBorder(),
                        ),
                        child: White15text(text: S.of(context).search),
                      );
                    },
                  ),
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
