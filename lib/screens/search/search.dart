import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/screens/LegalConsultantProfile.dart';
import 'package:lawyer/screens/widgets/black18text.dart';
import 'package:lawyer/screens/widgets/lawyercard.dart';
import 'package:lottie/lottie.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String dropvalue = "all";
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List clients = [
      DropdownMenuItem(
        value: "Legal consultant",
        child: Container(
          width: size.width / 2,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 246, 238, 161),
              borderRadius: BorderRadius.circular(20.r)),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Black18text(text: "Legal consultant"),
          ),
        ),
      ),
      DropdownMenuItem(
        value: "Typing center",
        child: Container(
          width: size.width / 2,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 246, 238, 161),
              borderRadius: BorderRadius.circular(20.r)),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Black18text(text: "Typing center"),
          ),
        ),
      ),
      DropdownMenuItem(
        value: "Client",
        child: Container(
          width: size.width / 2,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 246, 238, 161),
              borderRadius: BorderRadius.circular(20.r)),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Black18text(text: "Client"),
          ),
        ),
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 3.h),
          child: Column(
            children: [
              SizedBox(
                height: size.height / 15,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width / 8,
                        child: PopupMenuButton(
                          icon: Icon(
                            FontAwesomeIcons.sliders,
                            size: 35.r,
                            color: Colors.orange,
                          ),
                          position: PopupMenuPosition.under,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r)),
                          color: const Color.fromARGB(255, 246, 238, 161),
                          itemBuilder: (BuildContext context) {
                            return [
                              PopupMenuItem(
                                value: "Abu Dhab",
                                child: Container(
                                  width: size.width / 3,
                                  decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Black18text(text: "Abu Dhab"),
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                value: "Dubai ",
                                child: Container(
                                  width: size.width / 3,
                                  decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Black18text(text: "Dubai"),
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                value: "Dubai ",
                                child: Container(
                                  width: size.width / 3,
                                  decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Black18text(text: "Dubai"),
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                value: "Dubai ",
                                child: Container(
                                  width: size.width / 3,
                                  decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Black18text(text: "Dubai"),
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                value: "Dubai ",
                                child: Container(
                                  width: size.width / 3,
                                  decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Black18text(text: "Dubai"),
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                value: "Dubai ",
                                child: Container(
                                  width: size.width / 3,
                                  decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Black18text(text: "Dubai"),
                                  ),
                                ),
                              ),
                            ];
                          },
                        ),
                      ),
                      SizedBox(
                        width: size.width / 1.2,
                        child: Form(
                          child: TextFormField(
                            onChanged: (string) {
                              setState(() {});
                              // bloc.add(GetSearchProductsEvent(
                              //     pageNum: 1, search: string, perPage: 100));
                            },
                            controller: controller,
                            enabled: true,
                            style:
                                TextStyle(color: Colors.black, fontSize: 18.sp),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              hintText: "search",
                              hintStyle: const TextStyle(color: Colors.grey),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 246, 238, 161),
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
                              border: OutlineInputBorder(
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
              SizedBox(
                child: Text(
                  "results :",
                  style: TextStyle(fontSize: 20.sp),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              (controller.value.text.isEmpty)
                  ? Center(
                      child: Lottie.asset(
                        'assets/lottie/searching.json',
                        fit: BoxFit.cover,
                        height: 250.h,
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: 5,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) =>
                              //           const Legalconsultantprofile()),
                              // );
                            },
                            // child: const Lawyerscard(lawyer: ,),
                          );
                        },
                      ),
                    )
            ],
          ),
        ),
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