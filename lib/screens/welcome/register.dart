import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/core/utils/formstatus.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/pages/pages.dart';
import 'package:lawyer/screens/welcome/client_register.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/welcome/lawyer_register.dart';
import 'package:lawyer/screens/welcome/login.dart';
import 'package:lawyer/screens/widgets/black18text.dart';
import 'package:lawyer/screens/widgets/black16text.dart';
import 'package:lawyer/screens/widgets/info_input.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String dropvalue = "select ";
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    number.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> types = [
      "Lawyer",
      // "Legal consultant",
      // "Typing center",
      "Client"
    ];

    List<DropdownMenuEntry> clients = [];
    for (var i = 0; i < types.length; i++) {
      clients.add(
        DropdownMenuEntry(
          value: (i + 1).toString(),
          label: types[i],
        ),
      );
    }
    return BlocBuilder<EnterBloc, EnterState>(
      builder: (context, state) {
        return Scaffold(
          body: Container(
            height: size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                opacity: 0.5,
                image: AssetImage(
                  "assets/images/screen.jpg",
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 25.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset("assets/images/logo.png"),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          InfoInput(
                              name: S.of(context).Name,
                              hint: "Client name",
                              validator: (value) => state.isValidName
                                  ? null
                                  : S.of(context).namevalidate,
                              onchange: (value) =>
                                  context.read<EnterBloc>().add(
                                        LoginNameChanged(name: value),
                                      ),
                              controller: name),
                          SizedBox(
                            height: 20.h,
                          ),
                          InfoInput(
                              name: S.of(context).Emailaddress,
                              hint: "Client@gmail.com",
                              validator: (value) => state.isValidEmail
                                  ? null
                                  : S.of(context).emailvalidate,
                              onchange: (value) =>
                                  context.read<EnterBloc>().add(
                                        LoginEmailChanged(email: value),
                                      ),
                              controller: email),
                          SizedBox(
                            height: 20.h,
                          ),
                          InfoInput(
                              name: S.of(context).Contactnumber,
                              hint: "000000000",
                              validator: (value) {
                                return state.isValidnumber
                                    ? null
                                    : S.of(context).numbervalidate;
                              },
                              onchange: (value) {
                                return context.read<EnterBloc>().add(
                                      LoginNumberChanged(number: value),
                                    );
                              },
                              controller: number),
                          SizedBox(
                            height: 20.h,
                          ),
                          InfoInput(
                              name: S.of(context).Password,
                              hint: "*******",
                              validator: (value) => state.isValidPassword
                                  ? null
                                  : S.of(context).passwordvalidate,
                              onchange: (value) =>
                                  context.read<EnterBloc>().add(
                                        LoginPasswordChanged(password: value),
                                      ),
                              controller: password),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: 20.h),
                            child: DropdownMenu(
                              menuStyle: MenuStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.white.withOpacity(0.5)),
                                side: MaterialStatePropertyAll(BorderSide.none),
                                alignment: Alignment.bottomCenter,
                              ),
                              hintText: (state.type.isEmpty)
                                  ? S.of(context).select
                                  : types[int.parse(state.type) - 1],
                              dropdownMenuEntries: clients,
                              onSelected: (v) {
                                context.read<EnterBloc>().add(
                                      TypeChanged(type: v),
                                    );
                                print(v);

                                if (v == "2") {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ClientRegister()),
                                  );
                                } else if (v == "1") {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LawyerRegister()),
                                  );
                                }
                              },
                            ),
                          ),

                          // BlocListener<EnterBloc, EnterState>(
                          //   listener: (context, state) {
                          //     if (state.formStatus is SubmissionSuccess) {
                          //       ScaffoldMessenger.of(context).showSnackBar(
                          //         SnackBar(
                          //           backgroundColor: Colors.green,
                          //           duration: const Duration(seconds: 2),
                          //           content: Text(
                          //             state.message,
                          //             style: TextStyle(
                          //                 fontSize: 14.sp,
                          //                 color: Colors.white),
                          //           ),
                          //         ),
                          //       );
                          //       Navigator.pushReplacement(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) => const MyPages()),
                          //       );
                          //     } else if (state.formStatus
                          //         is SubmissionFailed) {
                          //       ScaffoldMessenger.of(context).showSnackBar(
                          //         SnackBar(
                          //           backgroundColor: Colors.red,
                          //           duration: const Duration(seconds: 2),
                          //           content: Text(
                          //             state.message,
                          //             style: TextStyle(
                          //                 fontSize: 14.sp,
                          //                 color: Colors.white),
                          //           ),
                          //         ),
                          //       );
                          //     }
                          //   },
                          //   child: ElevatedButton(
                          //     onPressed: () {
                          //       if (formKey.currentState!.validate()) {
                          //         if ((state.formStatus is FormSubmitting)) {
                          //         } else {
                          //           context
                          //               .read<EnterBloc>()
                          //               .add(RegisterSubmitted());
                          //         }
                          //       }

                          //       print(state.email);
                          //       print("=============");
                          //       print(state.name);
                          //       print("=============");
                          //       print(state.number);
                          //       print("=============");
                          //       print(state.password);
                          //       print("=============");
                          //       print(state.type);
                          //       print("=============");
                          //       print(state.formStatus);
                          //     },
                          //     style: ElevatedButton.styleFrom(
                          //       fixedSize:
                          //           Size(size.width / 1.2, size.height / 18),
                          //       backgroundColor:
                          //           const Color.fromARGB(255, 68, 68, 68),
                          //       shape: const BeveledRectangleBorder(),
                          //     ),
                          //     child: (state.formStatus is FormSubmitting)
                          //         ? CircularProgressIndicator(
                          //             color: AppColor.whiteColor,
                          //             strokeWidth: 4.w,
                          //           )
                          //         : Text(
                          //             S.of(context).register,
                          //             style: TextStyle(
                          //                 fontSize: 20.sp,
                          //                 color: Colors.black,
                          //                 fontWeight: FontWeight.bold),
                          //           ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Black16text(text: S.of(context).Alreadyhaveanaccount),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Login(),
                              ),
                            );
                          },
                          child: Black18text(text: S.of(context).LogInbotton))
                    ],
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
