import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/screens/widgets/black18text.dart';
import 'package:my_fatoorah/my_fatoorah.dart';

class Consultation extends StatefulWidget {
  const Consultation({super.key});

  @override
  State<Consultation> createState() => _ConsultationState();
}

class _ConsultationState extends State<Consultation> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "CONSULTANTION",
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Black18text(text: "lawyer`s name"),
              SizedBox(
                height: 10.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                width: size.width,
                height: size.height / 2,
                child: Form(
                  child: TextFormField(
                    onChanged: (string) {
                      setState(() {});
                      // bloc.add(GetSearchProductsEvent(
                      //     pageNum: 1, search: string, perPage: 100));
                    },
                    controller: controller,
                    minLines: 20,
                    maxLines: 30,
                    enabled: true,
                    style: TextStyle(color: Colors.black, fontSize: 18.sp),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      hintText: "TYPE YOUR QUESTIONS",
                      hintStyle: TextStyle(
                          fontSize: 24.sp,
                          color: AppColor.apporange,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColor.apporange,
                          decorationThickness: 3,
                          decorationStyle: TextDecorationStyle.dotted),
                      filled: true,
                      fillColor: AppColor.appgray,
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                width: size.width,
                child: Text(
                  textAlign: TextAlign.center,
                  "THE DETAIL ANSWER WILL COST BASED ON THE LAW PRACTITIONER'S RATE OR SET PRICE OF THIS CONSULTAION",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColor.apporange,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColor.apporange,
                    decorationThickness: 3.h,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: size.height / 15,
                width: size.width / 2.5,
                child: ElevatedButton(
                  onPressed: () async {
                    var response = await MyFatoorah.startPayment(
                      context: context,
                      request: MyfatoorahRequest.test(
                        currencyIso: Country.UAE,
                        successUrl:
                            'https://dealersupport.co.uk/wp-content/uploads/2023/08/iStock-1124532572.jpg',
                        errorUrl: 'https://www.google.com/',
                        invoiceAmount: 100,
                        language: ApiLanguage.English,
                        token:
                            "rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL",
                      ),
                    );
                    print(response.paymentId.toString());
                    print(response.status.toString());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: StadiumBorder(
                      side: BorderSide(color: Colors.black, width: 1.5.w),
                    ),
                  ),
                  child: Text(
                    "pay & send",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                width: size.width,
                child: Text(
                  textAlign: TextAlign.center,
                  "IF NOT ANSWERED IN 48 HOURS YOUR MONEY WILL BE SENT BACK TO YOUR ACCOUNT",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColor.apporange,
                    fontWeight: FontWeight.w900,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColor.apporange,
                    decorationThickness: 3.h,
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
