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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<EnterBloc, EnterState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar:
              (state.bottom) ? const Imagepicker() : const SizedBox.shrink(),
          body: Container(
            height: size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/screen.jpg",
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 10.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/logo.png"),
                    Black18text(text: S.of(context).Expertise),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Enter expertise'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Enter expertise'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Enter expertise'),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Black18text(text: S.of(context).Certifications),
                    (state.certifications!.isEmpty)
                        ? Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  bottom = !bottom;
                                  context.read<EnterBloc>().add(
                                        Bottomshow(
                                            bottom: bottom,
                                            destenation: "Certifications"),
                                      );
                                },
                                child: Icon(
                                  Icons.upload_file_sharp,
                                  size: 75.r,
                                  color: AppColor.offblack,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  bottom = !bottom;
                                  context.read<EnterBloc>().add(
                                        Bottomshow(
                                            bottom: bottom,
                                            destenation: "Certifications"),
                                      );
                                },
                                child: Icon(
                                  Icons.upload_file_sharp,
                                  size: 75.r,
                                  color: AppColor.offblack,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  bottom = !bottom;
                                  context.read<EnterBloc>().add(
                                        Bottomshow(
                                            bottom: bottom,
                                            destenation: "Certifications"),
                                      );
                                },
                                child: Icon(
                                  Icons.upload_file_sharp,
                                  size: 75.r,
                                  color: AppColor.offblack,
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
                                        context.read<EnterBloc>().add(
                                            Bottomshow(
                                                bottom: bottom,
                                                destenation: "Certifications"));
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        child: SizedBox(
                                          height: size.height / 7,
                                          width: size.width / 2.5,
                                          child: Image.file(
                                            state.certifications![index],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    (index == state.certifications!.length - 1)
                                        ? GestureDetector(
                                            onTap: () {
                                              bottom = !bottom;
                                              context.read<EnterBloc>().add(
                                                    Bottomshow(
                                                        bottom: bottom,
                                                        destenation:
                                                            "Certifications"),
                                                  );
                                            },
                                            child: Icon(
                                              Icons.upload_file_sharp,
                                              size: 80.r,
                                              color: AppColor.offblack,
                                            ),
                                          )
                                        : const SizedBox.shrink()
                                  ],
                                );
                              },
                            ),
                          ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Black18text(text: S.of(context).License),
                    (state.license!.isEmpty)
                        ? Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  bottom = !bottom;
                                  context.read<EnterBloc>().add(
                                        Bottomshow(
                                            bottom: bottom,
                                            destenation: "license"),
                                      );
                                },
                                child: Icon(
                                  Icons.credit_card,
                                  size: 75.r,
                                  color: AppColor.offblack,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  bottom = !bottom;
                                  context.read<EnterBloc>().add(
                                        Bottomshow(
                                            bottom: bottom,
                                            destenation: "license"),
                                      );
                                },
                                child: Icon(
                                  Icons.credit_card,
                                  size: 75.r,
                                  color: AppColor.offblack,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  bottom = !bottom;
                                  context.read<EnterBloc>().add(
                                        Bottomshow(
                                            bottom: bottom,
                                            destenation: "license"),
                                      );
                                },
                                child: Icon(
                                  Icons.credit_card,
                                  size: 75.r,
                                  color: AppColor.offblack,
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
                                        context.read<EnterBloc>().add(
                                            Bottomshow(
                                                bottom: bottom,
                                                destenation: "license"));
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        child: SizedBox(
                                          height: size.height / 7,
                                          width: size.width / 2.5,
                                          child: Image.file(
                                            state.license![index],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    (index == state.license!.length - 1)
                                        ? GestureDetector(
                                            onTap: () {
                                              bottom = !bottom;
                                              context.read<EnterBloc>().add(
                                                    Bottomshow(
                                                        bottom: bottom,
                                                        destenation: "license"),
                                                  );
                                            },
                                            child: Icon(
                                              Icons.credit_card,
                                              size: 80.r,
                                              color: AppColor.offblack,
                                            ),
                                          )
                                        : const SizedBox.shrink()
                                  ],
                                );
                              },
                            ),
                          ),
                    SizedBox(
                      height: 20.h,
                    ),
                    InfoInput(
                        name: S.of(context).consultationprice,
                        hint: "50",
                        validator: null,
                        onchange: (value) => context.read<EnterBloc>().add(
                              ConsultationPriceChanged(
                                  consultationprice: value),
                            ),
                        controller: consultationprice),
                    SizedBox(
                      height: 20.h,
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
                          minLines: 3,
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
                            fillColor: AppColor.appgray,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (_) {}),
                        Text('Available 24/7'),
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
                                      fontSize: 14.sp, color: Colors.white),
                                ),
                              ),
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyPages()),
                            );
                          } else if (state.formStatus is SubmissionFailed) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                duration: const Duration(seconds: 2),
                                content: Text(
                                  state.message,
                                  style: TextStyle(
                                      fontSize: 14.sp, color: Colors.white),
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
                                  .add(RegisterSubmitted());
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
                            backgroundColor:
                                const Color.fromARGB(255, 68, 68, 68),
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
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
