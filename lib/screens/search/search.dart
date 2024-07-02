import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/general-question/frequently-questions.dart';
import 'package:lawyer/screens/general-question/frequently-questions_component.dart';
import 'package:lawyer/screens/lawyers_and_translation_company/lawyersavilable.dart';
import 'package:lawyer/screens/lawyers_and_translation_company/lawyerspage.dart';
import 'package:lawyer/screens/lawyers_and_translation_company/translation_company.dart';
import 'package:lawyer/screens/news/news.dart';
import 'package:lawyer/screens/search/controller/search_bloc.dart';
import 'package:lawyer/screens/search/search_component.dart';
import 'package:lawyer/screens/general-question/general_question.dart';
import 'package:lawyer/screens/the_form/form_pages.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/widgets/home_container.dart';
import 'package:lawyer/screens/widgets/lawyers_home_container.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController controller = TextEditingController();
  bool filter = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => SearchBloc(),
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 3.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: size.height / 16,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: size.width / 1.2,
                            child: Form(
                              child: TextFormField(
                                onTap: () {
                                  filter = !state.filter;

                                  context.read<SearchBloc>().add(
                                        Filtershow(filter: filter),
                                      );
                                  if (filter) {
                                    context.read<SearchBloc>().add(
                                          Searchlawyers(),
                                        );
                                  } else {
                                    controller.clear();
                                  }
                                },
                                onChanged: (string) {
                                  context.read<SearchBloc>().add(
                                        ChangeSearchField(searchfield: string),
                                      );
                                },
                                controller: controller,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18.sp),
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2.w),
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  hintText: S
                                      .of(context)
                                      .WhoareyoulookingforTaxLawyer,
                                  hintStyle: const TextStyle(
                                      color: Colors.black, fontSize: 14),
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      context.read<SearchBloc>().add(
                                            Searchlawyers(),
                                          );
                                    },
                                    child: Icon(
                                      Icons.search,
                                      size: 33.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 2.w,
                                    ),
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 2.w,
                                    ),
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 2.w,
                                    ),
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  (state.filter)
                      ? const Expanded(child: Searchcomponent())
                      : Padding(
                          padding: EdgeInsets.only(bottom: size.height / 50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const News(),
                              SizedBox(
                                height: 10.h,
                              ),
                              LawyerHomeContainer(
                                  ontap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Lawyerspage()),
                                    );
                                  },
                                  image:
                                      "assets/images/frequently asked questions.png",
                                  text: S.of(context).LAWPRACTIONERS),
                              SizedBox(
                                height: 10.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    HomeContainer(
                                      ontap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Generalquestion()),
                                        );
                                      },
                                      image:
                                          "assets/images/generalquestion.png",
                                      text: S.of(context).GeneralQuestions,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    BlocBuilder<EnterBloc, EnterState>(
                                      builder: (context, state) {
                                        return (state.user.role == "client")
                                            ? HomeContainer(
                                                ontap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const TranslationCompanys()),
                                                  );
                                                },
                                                image:
                                                    "assets/images/translationcompany.png",
                                                text: S
                                                    .of(context)
                                                    .translationcompany,
                                              )
                                            : HomeContainer(
                                                ontap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const FormPages()),
                                                  );
                                                },
                                                image: "assets/images/chat.png",
                                                text: S.of(context).Theforum,
                                              );
                                      },
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    HomeContainer(
                                      ontap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const FrequentlyQuestions()),
                                        );
                                      },
                                      image:
                                          "assets/images/frequently asked questions.png",
                                      text: S
                                          .of(context)
                                          .frequentlyaskedquestions,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 35.w,
                                  top: 10.h,
                                  right: 35.w,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LawyersAvailable()),
                                        );
                                      },
                                      child: Text(
                                        S.of(context).lawyersAvailable,
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
