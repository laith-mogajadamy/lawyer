import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/search/controller/search_bloc.dart';
import 'package:lawyer/screens/search/search_component.dart';
import 'package:lawyer/screens/widgets/black16text.dart';
import 'package:lawyer/screens/general-question/general_question.dart';

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
                                          Searchlawyers(query: ''),
                                        );
                                  } else {
                                    controller.clear();
                                  }
                                },
                                onChanged: (string) {
                                  context.read<SearchBloc>().add(
                                        Searchlawyers(query: string),
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
                                  prefixIcon: InkWell(
                                    onTap: () {
                                      // bloc.add(GetSearchProductsEvent(
                                      //     pageNum: 1,
                                      //     search: controller.text,
                                      //     perPage: 100));
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Black16text(text: S.of(context).GeneralQuestions),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Generalquestion()),
                                  );
                                },
                                child: Container(
                                  width: size.width / 1.2,
                                  height: size.height / 6,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                        "assets/images/general question.jpg",
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
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
 // : Builder(builder: (context) {
                  //     switch (state.searchProductsState) {
                  //       case RequestState.loading:
                  //         return Center(
                  //           child: Container(
                  //             alignment: Alignment.center,
                  //             child: Center(
                  //               child: Lottie.asset(
                  //                 'assets/lottie/searching.json',
                  //                 fit: BoxFit.cover,
                  //                 height: 250.h,
                  //               ),
                  //             ),
                  //           ),
                  //         );
                  //       case RequestState.loaded:
                  //         return Expanded(
                  //           child: GridView.builder(
                  //             gridDelegate:
                  //                 SliverGridDelegateWithFixedCrossAxisCount(
                  //                     crossAxisCount: 2,
                  //                     childAspectRatio: 0.62),
                  //             itemCount: state.searchProducts.length,
                  //             itemBuilder:
                  //                 (BuildContext context, int index) {
                  //               return Padding(
                  //                 padding: EdgeInsets.symmetric(
                  //                     horizontal: 3.w, vertical: 3.h),
                  //                 child: InkWell(
                  //                   onTap: () {
                  //                     Navigator.push(
                  //                         context,
                  //                         MaterialPageRoute(
                  //                             builder: (context) =>
                  //                                 ProductScreen(
                  //                                   product: state
                  //                                           .searchProducts[
                  //                                       index],
                  //                                   products: state
                  //                                       .searchProducts,
                  //                                 )));
                  //                   },
                  //                   child: ProductCard(
                  //                     productname: state
                  //                         .searchProducts[index].name,
                  //                     price: state
                  //                         .searchProducts[index].price,
                  //                     orginalprice: state
                  //                         .searchProducts[index]
                  //                         .regularPrice,
                  //                     image: state.searchProducts[index]
                  //                             .images.isNotEmpty
                  //                         ? state.searchProducts[index]
                  //                             .images[0].src
                  //                         : '',
                  //                   ),
                  //                 ),
                  //               );
                  //             },
                  //           ),
                  //         );
                  //     }
                  //   }
                  //   ),