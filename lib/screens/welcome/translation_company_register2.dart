import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/core/utils/formstatus.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/pages/pages.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/widgets/bio_input.dart';
import 'package:lawyer/screens/widgets/black22text.dart';
import 'package:lawyer/screens/widgets/certification_field.dart';
import 'package:lawyer/screens/widgets/check_available.dart';
import 'package:lawyer/screens/widgets/imagepicker.dart';
import 'package:lawyer/screens/widgets/info_input.dart';
import 'package:lawyer/screens/widgets/license_flield.dart';
import 'package:lawyer/screens/widgets/select_language.dart';

class TranslationCompanyRegister2 extends StatefulWidget {
  const TranslationCompanyRegister2({super.key});

  @override
  State<TranslationCompanyRegister2> createState() =>
      _TranslationCompanyRegister2State();
}

class _TranslationCompanyRegister2State
    extends State<TranslationCompanyRegister2> {
  bool bottom = false;
  TextEditingController consultationprice = TextEditingController();
  TextEditingController yearsofpractice = TextEditingController();

  TextEditingController language = TextEditingController();
  TextEditingController facebook = TextEditingController();
  TextEditingController tiktok = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<EnterBloc, EnterState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar:
              (state.bottom) ? const Imagepicker() : const SizedBox.shrink(),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 25.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Image.asset("assets/images/logo.png"),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Center(
                        child: Black22text(text: S.of(context).registeration)),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const SelectLanguage(),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const CertificationField(),
                  SizedBox(
                    height: 20.h,
                  ),
                  const LicenseFlield(),
                  SizedBox(
                    height: 20.h,
                  ),
                  InfoInput(
                      name: S.of(context).PricePerPage,
                      hint: "50",
                      validator: null,
                      onchange: (value) => context.read<EnterBloc>().add(
                            ConsultationPriceChanged(consultationprice: value),
                          ),
                      controller: consultationprice),
                  SizedBox(
                    height: 20.h,
                  ),
                  InfoInput(
                    name: "facebook :",
                    hint: "",
                    validator: null,
                    onchange: (value) => context.read<EnterBloc>().add(
                          FacebookChanged(facebook: value),
                        ),
                    controller: facebook,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  InfoInput(
                    name: "tiktok :",
                    hint: "",
                    validator: null,
                    onchange: (value) => context.read<EnterBloc>().add(
                          TiktokChanged(tiktok: value),
                        ),
                    controller: tiktok,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const BioInput(),
                  SizedBox(
                    height: 20.h,
                  ),
                  const CheckAvailablewidget(),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: BlocListener<EnterBloc, EnterState>(
                      listener: (context, state) {
                        if (state.formStatus is SubmissionSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.green,
                              duration: const Duration(seconds: 2),
                              content: Text(
                                state.message,
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyPages(),
                            ),
                            (route) => false,
                          );
                        } else if (state.formStatus is SubmissionFailed) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              duration: const Duration(seconds: 2),
                              content: Text(
                                state.message,
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        }
                      },
                      child: ElevatedButton(
                        onPressed: () {
                          if ((state.formStatus is FormSubmitting)) {
                          } else {
                            context
                                .read<EnterBloc>()
                                .add(CompanyRegisterSubmitted(type: "3"));
                          }
                          // print(state.email);
                          // print("=============");
                          // print(state.name);
                          // print("=============");
                          // print(state.number);
                          // print("=============");
                          // print(state.password);
                          // print("=============");
                          // print(state.type);
                          // print("=============");
                          // print(state.formStatus);
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(size.width / 1.2, size.height / 18),
                          backgroundColor: AppColor.offblack,
                          shape: const BeveledRectangleBorder(),
                        ),
                        child: (state.formStatus is FormSubmitting)
                            ? CircularProgressIndicator(
                                color: AppColor.whiteColor,
                                strokeWidth: 4.w,
                              )
                            : Text(
                                S.of(context).SignUp,
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
