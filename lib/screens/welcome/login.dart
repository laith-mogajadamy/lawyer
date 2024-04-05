import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/formstatus.dart';
import 'package:lawyer/screens/pages/pages.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/widgets/black22text.dart';
import 'package:lawyer/screens/widgets/orange22text.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email_username = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    email_username.dispose();
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                                child: Black22text(text: " Username")),
                            SizedBox(
                              width: size.width / 2,
                              child: TextFormField(
                                controller: email_username,
                                validator: (value) => state.isValidUsername
                                    ? null
                                    : "Email or Username is too short",
                                onChanged: (value) =>
                                    context.read<EnterBloc>().add(
                                          LoginEmailChanged(email: value),
                                        ),
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18.sp),
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  fillColor:
                                      const Color.fromARGB(255, 253, 242, 150),
                                  filled: true,
                                  hintText: "Client@gmail.com",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 16.sp),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(
                                      30.r,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                                child: Black22text(text: "Password")),
                            SizedBox(
                              width: size.width / 2,
                              child: TextFormField(
                                controller: password,
                                validator: (value) => state.isValidPassword
                                    ? null
                                    : 'Password is too short',
                                onChanged: (value) =>
                                    context.read<EnterBloc>().add(
                                          LoginPasswordChanged(password: value),
                                        ),
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18.sp),
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  fillColor:
                                      const Color.fromARGB(255, 253, 242, 150),
                                  filled: true,
                                  hintText: "*******",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 16.sp),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(
                                      30.r,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
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
                    child: Text(
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
