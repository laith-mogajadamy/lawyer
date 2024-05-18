import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/search/controller/search_bloc.dart';
import 'package:lawyer/screens/widgets/black16text.dart';
import 'package:lawyer/screens/widgets/black18text.dart';

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
                ElevatedButton(
                  onPressed: () {
                    context.read<SearchBloc>().add(
                          ChangeSearchField(searchfield: "location"),
                        );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 68, 68, 68),
                    shape: const BeveledRectangleBorder(),
                  ),
                  child: Black18text(text: S.of(context).location),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<SearchBloc>().add(
                          ChangeSearchField(searchfield: "Practice"),
                        );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 68, 68, 68),
                    shape: const BeveledRectangleBorder(),
                  ),
                  child: Black18text(text: S.of(context).Practice),
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
                      : state.practices.length,
                  itemBuilder: (BuildContext context, int index) {
                    print(state.location);
                    return (state.searchfield == "location")
                        ? Row(
                            children: [
                              Checkbox(
                                value:
                                    (state.locations[index][1]) ? true : false,
                                onChanged: (value) {
                                  print(index);
                                  print(value);
                                  context.read<SearchBloc>().add(
                                        Check(check: value, index: index),
                                      );
                                  setState(() {});
                                },
                              ),
                              Black16text(
                                text: state.locations[index][0],
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Checkbox(
                                value:
                                    (state.practices[index][1]) ? true : false,
                                onChanged: (value) {
                                  print(index);
                                  print(value);
                                  context.read<SearchBloc>().add(
                                        Check(check: value, index: index),
                                      );
                                  setState(() {});
                                },
                              ),
                              Black16text(
                                text: state.practices[index][0],
                              ),
                            ],
                          );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
