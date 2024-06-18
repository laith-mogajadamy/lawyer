import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/core/utils/formstatus.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/pages/pages.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/widgets/black18text.dart';
import 'package:lawyer/screens/widgets/black22text.dart';
import 'package:lawyer/screens/widgets/expertise_input.dart';
import 'package:lawyer/screens/widgets/imagepicker.dart';
import 'package:lawyer/screens/widgets/info_input.dart';

class LawyerRegister2 extends StatefulWidget {
  const LawyerRegister2({super.key});

  @override
  State<LawyerRegister2> createState() => _LawyerRegister2State();
}

class _LawyerRegister2State extends State<LawyerRegister2> {
  bool bottom = false;
  TextEditingController consultationprice = TextEditingController();
  TextEditingController expertise = TextEditingController();

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
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Center(
                        child: Black22text(text: S.of(context).registeration)),
                  ),
                  Black18text(text: S.of(context).Expertise),
                  (state.expertise!.isEmpty)
                      ? Column(
                          children: [
                            ExpertiseInput(
                              expertise: expertise,
                              hint: S.of(context).AddExpertise,
                              oncomplete: () {
                                context.read<EnterBloc>().add(
                                      AddExpertise(expertise: expertise.text),
                                    );
                                expertise.clear();
                              },
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            ExpertiseInput(
                              expertise: expertise,
                              hint: S.of(context).AddExpertise,
                              oncomplete: () {
                                context.read<EnterBloc>().add(
                                      AddExpertise(expertise: expertise.text),
                                    );
                                expertise.clear();
                              },
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            ExpertiseInput(
                              expertise: expertise,
                              hint: S.of(context).AddExpertise,
                              oncomplete: () {
                                context.read<EnterBloc>().add(
                                      AddExpertise(expertise: expertise.text),
                                    );
                                expertise.clear();
                              },
                            ),
                          ],
                        )
                      : SizedBox(
                          height: size.height / 5,
                          child: ListView.builder(
                            itemCount: state.expertise!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 5.h),
                                      child: Black18text(
                                        text: state.expertise![index],
                                      ),
                                    ),
                                    (index == state.expertise!.length - 1)
                                        ? ExpertiseInput(
                                            expertise: expertise,
                                            hint: S.of(context).AddExpertise,
                                            oncomplete: () {
                                              context.read<EnterBloc>().add(
                                                    AddExpertise(
                                                        expertise:
                                                            expertise.text),
                                                  );
                                              expertise.clear();
                                            },
                                          )
                                        : const SizedBox.shrink(),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Black18text(text: S.of(context).Certifications),
                  SizedBox(
                    height: 10.h,
                  ),
                  (state.certifications!.isEmpty)
                      ? Row(
                          children: [
                            SizedBox(
                              height: size.height / 8,
                              width: size.width / 4,
                              child: GestureDetector(
                                onTap: () {
                                  bottom = !bottom;
                                  context.read<EnterBloc>().add(
                                        Bottomshow(
                                            bottom: bottom,
                                            destenation: "Certifications"),
                                      );
                                },
                                child: Image.asset(
                                    fit: BoxFit.contain,
                                    "assets/images/certificcation.png"),
                              ),
                            ),
                            SizedBox(
                              height: size.height / 8,
                              width: size.width / 4,
                              child: GestureDetector(
                                onTap: () {
                                  bottom = !bottom;
                                  context.read<EnterBloc>().add(
                                        Bottomshow(
                                            bottom: bottom,
                                            destenation: "Certifications"),
                                      );
                                },
                                child: Image.asset(
                                    height: size.height / 30,
                                    fit: BoxFit.contain,
                                    "assets/images/certificcation.png"),
                              ),
                            ),
                            SizedBox(
                              height: size.height / 8,
                              width: size.width / 4,
                              child: GestureDetector(
                                onTap: () {
                                  bottom = !bottom;
                                  context.read<EnterBloc>().add(
                                        Bottomshow(
                                            bottom: bottom,
                                            destenation: "Certifications"),
                                      );
                                },
                                child: Image.asset(
                                    height: size.height / 30,
                                    fit: BoxFit.contain,
                                    "assets/images/certificcation.png"),
                              ),
                            ),
                          ],
                        )
                      : SizedBox(
                          height: size.height / 7,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.certifications!.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      bottom = !bottom;
                                      context.read<EnterBloc>().add(Bottomshow(
                                          bottom: bottom,
                                          destenation: "Certifications"));
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: SizedBox(
                                        height: size.height / 8,
                                        width: size.width / 2.5,
                                        child: Image.file(
                                          state.certifications![index],
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                  (index == state.certifications!.length - 1)
                                      ? SizedBox(
                                          height: size.height / 8,
                                          width: size.width / 4,
                                          child: GestureDetector(
                                            onTap: () {
                                              bottom = !bottom;
                                              context.read<EnterBloc>().add(
                                                    Bottomshow(
                                                        bottom: bottom,
                                                        destenation:
                                                            "Certifications"),
                                                  );
                                            },
                                            child: Image.asset(
                                                fit: BoxFit.contain,
                                                "assets/images/certificcation.png"),
                                          ),
                                        )
                                      : const SizedBox.shrink()
                                ],
                              );
                            },
                          ),
                        ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Black18text(text: S.of(context).License),
                  (state.license!.isEmpty)
                      ? Row(
                          children: [
                            SizedBox(
                              height: size.height / 8,
                              width: size.width / 4,
                              child: GestureDetector(
                                onTap: () {
                                  bottom = !bottom;
                                  context.read<EnterBloc>().add(
                                        Bottomshow(
                                            bottom: bottom,
                                            destenation: "license"),
                                      );
                                },
                                child: Image.asset(
                                  fit: BoxFit.contain,
                                  "assets/images/license.png",
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height / 8,
                              width: size.width / 4,
                              child: GestureDetector(
                                onTap: () {
                                  bottom = !bottom;
                                  context.read<EnterBloc>().add(
                                        Bottomshow(
                                            bottom: bottom,
                                            destenation: "license"),
                                      );
                                },
                                child: Image.asset(
                                  fit: BoxFit.contain,
                                  "assets/images/license.png",
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height / 8,
                              width: size.width / 4,
                              child: GestureDetector(
                                onTap: () {
                                  bottom = !bottom;
                                  context.read<EnterBloc>().add(
                                        Bottomshow(
                                            bottom: bottom,
                                            destenation: "license"),
                                      );
                                },
                                child: Image.asset(
                                  fit: BoxFit.contain,
                                  "assets/images/license.png",
                                ),
                              ),
                            ),
                          ],
                        )
                      : SizedBox(
                          height: size.height / 7,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.license!.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      bottom = !bottom;
                                      context.read<EnterBloc>().add(Bottomshow(
                                          bottom: bottom,
                                          destenation: "license"));
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: SizedBox(
                                        height: size.height / 8,
                                        width: size.width / 2.5,
                                        child: Image.file(
                                          state.license![index],
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                  (index == state.license!.length - 1)
                                      ? SizedBox(
                                          height: size.height / 8,
                                          width: size.width / 4,
                                          child: GestureDetector(
                                            onTap: () {
                                              bottom = !bottom;
                                              context.read<EnterBloc>().add(
                                                    Bottomshow(
                                                        bottom: bottom,
                                                        destenation: "license"),
                                                  );
                                            },
                                            child: Image.asset(
                                              fit: BoxFit.contain,
                                              "assets/images/license.png",
                                            ),
                                          ),
                                        )
                                      : const SizedBox.shrink()
                                ],
                              );
                            },
                          ),
                        ),
                  SizedBox(
                    height: 10.h,
                  ),
                  InfoInput(
                      name: S.of(context).consultationprice,
                      hint: "50",
                      validator: null,
                      onchange: (value) => context.read<EnterBloc>().add(
                            ConsultationPriceChanged(consultationprice: value),
                          ),
                      controller: consultationprice),
                  SizedBox(
                    height: 10.h,
                  ),
                  Black18text(text: S.of(context).Biography),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: SizedBox(
                      width: size.width / 1.5,
                      child: TextFormField(
                        minLines: 2,
                        maxLines: 5,
                        onChanged: (value) => context.read<EnterBloc>().add(
                              BiographyChanged(biography: value),
                            ),
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.r),
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.r),
                            ),
                          ),
                          filled: true,
                          fillColor: AppColor.appgray.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: state.available,
                        onChanged: (check) {
                          context.read<EnterBloc>().add(
                                CheckAvailable(available: check),
                              );
                        },
                      ),
                      Text(
                        S.of(context).Available,
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
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
                                .add(ClientRegisterSubmitted());
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
