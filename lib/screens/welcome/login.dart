import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/core/utils/formstatus.dart';
import 'package:lawyer/screens/pages/pages.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/widgets/black22text.dart';
import 'package:lawyer/screens/widgets/info_input.dart';
import 'package:lawyer/screens/widgets/orange22text.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<EnterBloc, EnterState>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 25.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  children: [
                    Black22text(text: "BRIEFCASE"),
                    Orange22text(text: "LOGIN"),
                  ],
                ),
                Form(
                  key: formKey,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    child: Column(
                      children: [
                        InfoInput(
                            name: "email",
                            hint: "Client@gmail.com",
                            validator: (value) => state.isValidEmail
                                ? null
                                : "Email or Username is too short",
                            onchange: (value) => context.read<EnterBloc>().add(
                                  LoginEmailChanged(email: value),
                                ),
                            controller: email),
                        SizedBox(
                          height: 30.h,
                        ),
                        InfoInput(
                            name: "Password",
                            hint: "*******",
                            validator: (value) => state.isValidPassword
                                ? null
                                : 'Password is too short',
                            onchange: (value) => context.read<EnterBloc>().add(
                                  LoginPasswordChanged(password: value),
                                ),
                            controller: password),
                      ],
                    ),
                  ),
                ),
                BlocListener<EnterBloc, EnterState>(
                  listener: (context, state) {
                    if (state.formStatus is SubmissionSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green,
                          duration: const Duration(seconds: 2),
                          content: Text(
                            state.message,
                            style:
                                TextStyle(fontSize: 14.sp, color: Colors.white),
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
                            style:
                                TextStyle(fontSize: 14.sp, color: Colors.white),
                          ),
                        ),
                      );
                    }
                  },
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<EnterBloc>().add(LoginSubmitted());
                      }

                      print(state.email);
                      print("=============");
                      print(state.name);
                      print("=============");
                      print(state.number);
                      print("=============");
                      print(state.password);
                      print("=============");
                      print(state.type);
                      print("=============");
                      print(state.formStatus);
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(size.width / 2.3, size.height / 15),
                      backgroundColor: Colors.orange,
                      shape: const StadiumBorder(),
                    ),
                    child: (state.formStatus is FormSubmitting)
                        ? CircularProgressIndicator(
                            color: AppColor.whiteColor,
                            strokeWidth: 4.w,
                          )
                        : Text(
                            "next",
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
