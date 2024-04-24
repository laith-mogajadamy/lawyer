import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/screens/widgets/black18text.dart';
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
  bool popup = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> practice = [
      "Tax",
      "Business (corporate)",
      "Family",
      "Estate Planning",
      "Emoplyment & Labot",
      "Personal Injury",
      "Intellectual Property",
      "Immigration",
      "Constitutional",
      "Criminal Defense",
      "Bankruptcy",
      "Entertainment",
    ];
    List<PopupMenuItem> practiceitem = [];
    for (var i = 0; i < practice.length; i++) {
      practiceitem.add(
        PopupMenuItem(
          value: practice[i],
          child: Container(
            width: size.width / 3,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.black, width: 2.h))),
            child: Padding(
              padding: EdgeInsets.all(5.r),
              child: Black18text(text: practice[i]),
            ),
          ),
        ),
      );
    }
    List<String> places = [
      "Abu Dhab",
      " Dubai",
      "Abu Dhabi",
      "Ajman",
      "Al Ain",
      "Fujairah",
      "Ras Al Khaima",
      "Sharjah",
      "Um Al Quwain"
    ];
    List<PopupMenuItem> placesitems = [];
    for (var i = 0; i < places.length; i++) {
      placesitems.add(
        PopupMenuItem(
          value: places[i],
          child: Container(
            width: size.width / 3,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.black, width: 2.h))),
            child: Padding(
              padding: EdgeInsets.all(5.r),
              child: Black18text(text: places[i]),
            ),
          ),
        ),
      );
    }
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
                            color: AppColor.appgray,
                          ),
                          position: PopupMenuPosition.under,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r)),
                          color: AppColor.appgray,
                          itemBuilder: (BuildContext context) {
                            popup = !popup;
                            return (popup) ? placesitems : practiceitem;
                          },
                        ),
                      ),
                      SizedBox(
                        width: size.width / 1.2,
                        child: Form(
                          child: TextFormField(
                            onChanged: (string) {
                              setState(() {});
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
                              fillColor: AppColor.appgray,
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