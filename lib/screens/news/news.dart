import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/news/controller/news_bloc.dart';
import 'package:lawyer/screens/widgets/black12text.dart';
import 'package:lawyer/screens/widgets/black18text.dart';

class News extends StatelessWidget {
  const News({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {},
      child: Container(
        width: size.width / 1.2,
        height: size.height / 5,
        decoration: BoxDecoration(
          color: AppColor.appgray.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: size.height / 25,
                    width: size.width / 10,
                    child: Image.asset("assets/images/news.png"),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Black18text(text: S.of(context).News),
                ],
              ),
            ),
            BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.news.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Black12text(text: state.news[index]);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
