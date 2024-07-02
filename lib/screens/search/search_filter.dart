import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/search/controller/search_bloc.dart';
import 'package:lawyer/screens/widgets/black16text.dart';
import 'package:lawyer/screens/widgets/white15text.dart';

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
      height: size.height / 3,
      child: Column(
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
                            ChangeSearchField(searchfield: "location"),
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
                            ChangeSearchField(searchfield: "Practice"),
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
                            ChangeSearchField(searchfield: "language"),
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
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 4,
                    crossAxisCount: 2,
                  ),
                  itemCount: (state.searchfield == "location")
                      ? state.locations.length
                      : (state.searchfield == "Practice")
                          ? state.practices.length
                          : state.languages.length,
                  itemBuilder: (BuildContext context, int index) {
                    print(state.selectedlocations);
                    return (state.searchfield == "location")
                        ? Row(
                            children: [
                              Checkbox(
                                value: (state.selectedlocations.contains(
                                  state.locations[index],
                                )),
                                onChanged: (value) {
                                  context.read<SearchBloc>().add(
                                        Check(
                                            check: value,
                                            slelected: state.locations[index]),
                                      );
                                },
                              ),
                              Black16text(
                                text: state.locations[index],
                              ),
                            ],
                          )
                        : (state.searchfield == "Practice")
                            ? Row(
                                children: [
                                  Checkbox(
                                    value: (state.selectedpractices.contains(
                                      state.practices[index],
                                    )),
                                    onChanged: (value) {
                                      context.read<SearchBloc>().add(
                                            Check(
                                                check: value,
                                                slelected:
                                                    state.practices[index]),
                                          );
                                    },
                                  ),
                                  Black16text(
                                    text: state.practices[index],
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                  Checkbox(
                                    value: (state.selectedlanguages.contains(
                                      state.languages[index],
                                    )),
                                    onChanged: (value) {
                                      context.read<SearchBloc>().add(
                                            Check(
                                                check: value,
                                                slelected:
                                                    state.languages[index]),
                                          );
                                    },
                                  ),
                                  Black16text(
                                    text: state.languages[index],
                                  ),
                                ],
                              );
                  },
                ),
              );
            },
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
                  backgroundColor: const Color.fromARGB(255, 68, 68, 68),
                  shape: const BeveledRectangleBorder(),
                ),
                child: White15text(text: S.of(context).search),
              );
            },
          ),
        ],
      ),
    );
  }
}
