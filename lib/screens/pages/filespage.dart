import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/screens/widgets/black18text.dart';

class FilesPage extends StatefulWidget {
  const FilesPage({super.key});

  @override
  State<FilesPage> createState() => _FilesPageState();
}

class _FilesPageState extends State<FilesPage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
            child: SizedBox(
              height: size.height / 15,
              child: TextFormField(
                onChanged: (string) {
                  setState(() {});
                },
                controller: controller,
                enabled: false,
                style: TextStyle(color: Colors.black, fontSize: 18.sp),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  hintText: "search",
                  hintStyle: const TextStyle(color: Colors.black),
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
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: SizedBox(
              child: ListView.builder(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    child: SizedBox(
                      height: size.height / 12,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.folder,
                            size: 50.r,
                            color: AppColor.apporange,
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: AppColor.appgray,
                                borderRadius: BorderRadius.circular(30)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 5.h),
                              child:
                                  const Black18text(text: "title of the file"),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
