import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/core/utils/enums.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/models/lawyer.dart';
import 'package:lawyer/screens/consultation/controller/consultation_bloc.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/widgets/black18text.dart';
import 'package:my_fatoorah/my_fatoorah.dart';

class AddConsultation extends StatefulWidget {
  final Lawyer lawyer;

  const AddConsultation({super.key, required this.lawyer});

  @override
  State<AddConsultation> createState() => _AddConsultationState();
}

class _AddConsultationState extends State<AddConsultation> {
  TextEditingController title = TextEditingController();

  TextEditingController description = TextEditingController();
  final ConsultationBloc consultationBloc = ConsultationBloc();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => ConsultationBloc(),
      child: BlocBuilder<ConsultationBloc, ConsultationState>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
                child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      S.of(context).Consultations,
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Black18text(text: widget.lawyer.name),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      width: size.width,
                      child: TextFormField(
                        onChanged: (string) {},
                        controller: title,
                        minLines: 1,
                        maxLines: 3,
                        style: TextStyle(color: Colors.black, fontSize: 18.sp),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          hintText: S.of(context).Typeyourquestiontilte,
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
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      width: size.width,
                      child: TextFormField(
                        onChanged: (string) {},
                        controller: description,
                        minLines: 10,
                        maxLines: 30,
                        style: TextStyle(color: Colors.black, fontSize: 18.sp),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          hintText: S.of(context).Typeyourquestionwithdetails,
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
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      width: size.width,
                      child: Text(
                        textAlign: TextAlign.center,
                        S
                            .of(context)
                            .THEDETAILANSWERWILLCOSTBASEDONTHELAWPRACTITIONERSRATEORSETPRICEOFTHISCONSULTAION,
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
                      child: BlocListener<ConsultationBloc, ConsultationState>(
                        listener: (context, state) {
                          if (state.consultationState == RequestState.loaded) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.green,
                                duration: const Duration(seconds: 2),
                                content: Text(
                                  state.consultationMessage,
                                  style: TextStyle(
                                      fontSize: 14.sp, color: Colors.white),
                                ),
                              ),
                            );
                          } else if (state.consultationState ==
                              RequestState.error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                duration: const Duration(seconds: 2),
                                content: Text(
                                  state.consultationMessage,
                                  style: TextStyle(
                                      fontSize: 14.sp, color: Colors.white),
                                ),
                              ),
                            );
                          }
                        },
                        child:
                            BlocListener<ConsultationBloc, ConsultationState>(
                          listener: (context, state) {
                            if (state.invoicestate == RequestState.loaded) {
                              context.read<ConsultationBloc>().add(
                                    Addconsultation(
                                      id: widget.lawyer.id,
                                      title: title.text.trim(),
                                      description: description.text.trim(),
                                    ),
                                  );
                              title.clear();
                              description.clear();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.green,
                                  duration: const Duration(seconds: 2),
                                  content: Text(
                                    state.invoiceMessage,
                                    style: TextStyle(
                                        fontSize: 14.sp, color: Colors.white),
                                  ),
                                ),
                              );
                              if (state.consultationState ==
                                  RequestState.loaded) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    duration: const Duration(seconds: 2),
                                    content: Text(
                                      state.consultationMessage,
                                      style: TextStyle(
                                          fontSize: 14.sp, color: Colors.white),
                                    ),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    duration: const Duration(seconds: 2),
                                    content: Text(
                                      state.consultationMessage,
                                      style: TextStyle(
                                          fontSize: 14.sp, color: Colors.white),
                                    ),
                                  ),
                                );
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  duration: const Duration(seconds: 2),
                                  content: Text(
                                    state.invoiceMessage,
                                    style: TextStyle(
                                        fontSize: 14.sp, color: Colors.white),
                                  ),
                                ),
                              );
                            }
                          },
                          child: BlocBuilder<EnterBloc, EnterState>(
                            builder: (context, state) {
                              Locale currentLocale =
                                  Localizations.localeOf(context);
                              print(currentLocale.languageCode);

                              return ElevatedButton(
                                onPressed: () async {
                                  var response = await MyFatoorah.startPayment(
                                    context: context,
                                    request: MyfatoorahRequest.test(
                                      currencyIso: Country.UAE,
                                      successUrl:
                                          'https://dealersupport.co.uk/wp-content/uploads/2023/08/iStock-1124532572.jpg',
                                      errorUrl: 'https://www.google.com/',
                                      invoiceAmount: double.parse(
                                          widget.lawyer.consultationPrice),
                                      language:
                                          (currentLocale.languageCode == 'en')
                                              ? ApiLanguage.English
                                              : ApiLanguage.Arabic,
                                      token:
                                          "rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL",
                                    ),
                                  );
                                  print(response.paymentId);
                                  print(response.status);
                                  if (response.status ==
                                      PaymentStatus.Success) {
                                    consultationBloc.add(
                                      SendInvoice(
                                        invoiceId:
                                            response.paymentId.toString(),
                                        senderid: state.user.id.toString(),
                                        receiverid: widget.lawyer.id.toString(),
                                        consultationid: '',
                                        invoicevalue: widget
                                            .lawyer.consultationPrice
                                            .toString(),
                                      ),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  shape: StadiumBorder(
                                    side: BorderSide(
                                        color: Colors.black, width: 1.5.w),
                                  ),
                                ),
                                child: Text(
                                  S.of(context).paysend,
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      width: size.width,
                      child: Text(
                        textAlign: TextAlign.center,
                        S
                            .of(context)
                            .IFNOTANSWEREDIN48HOURSYOURMONEYWILLBESENTBACKTOYOURACCOUNT,
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
        },
      ),
    );
  }
}
