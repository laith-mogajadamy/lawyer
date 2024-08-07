import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/enums.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/lawyers_and_translation_company/controller/lawyers_bloc.dart';
import 'package:lawyer/screens/widgets/black22text.dart';
import 'package:lawyer/screens/widgets/contacts_card.dart';
import 'package:lawyer/screens/widgets/creat_group_button.dart';
import 'package:lawyer/screens/widgets/group_name_input.dart';
import 'package:lottie/lottie.dart';

class Contacts extends StatelessWidget {
  const Contacts({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => LawyersBloc()..add(Getlawyers()),
      child: BlocBuilder<LawyersBloc, LawyersState>(
        builder: (context, state) {
          switch (state.lawyersState) {
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
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: SizedBox(
                      height: size.height / 25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: size.width / 8,
                          ),
                          Black22text(text: S.of(context).Contacts),
                          GestureDetector(
                            onTap: () {
                              bool select = !state.selecte;

                              context.read<LawyersBloc>().add(
                                    Selecteshow(selecte: select),
                                  );
                            },
                            child: Image.asset(
                              "assets/images/creatgroup.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 0, right: 25.w, top: 20.h),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemCount: state.lawyers.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ContactsCard(
                            lawyer: state.lawyers[index],
                          );
                        },
                      ),
                    ),
                  ),
                  (state.selecte)
                      ? Column(
                          children: [
                            GroupNameInput(controller: controller),
                            SizedBox(height: 15.h),
                            CreatGroupButton(
                              controller: controller,
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
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
