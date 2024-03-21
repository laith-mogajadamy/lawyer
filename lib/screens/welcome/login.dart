import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    return BlocProvider(
      create: (context) => EnterBloc(),
      child: BlocBuilder<EnterBloc, EnterState>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
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
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                  child: Black22text(text: "Email address")),
                              SizedBox(
                                width: size.width / 2,
                                child: TextFormField(
                                  controller: email,
                                  validator: (value) => state.isValidUsername
                                      ? null
                                      : "email is too short",
                                  onChanged: (value) => context
                                      .read<EnterBloc>()
                                      .add(
                                        LoginUsernameChanged(username: value),
                                      ),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18.sp),
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    fillColor: const Color.fromARGB(
                                        255, 253, 242, 150),
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
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
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
                                  onChanged: (value) => context
                                      .read<EnterBloc>()
                                      .add(
                                        LoginPasswordChanged(password: value),
                                      ),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18.sp),
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    fillColor: const Color.fromARGB(
                                        255, 253, 242, 150),
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
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<EnterBloc>().add(LoginSubmitted());
                      }

                      print(state.username);
                      print("=============");
                      print(state.password);
                      print(state.formStatus);
                      if (state.formStatus is SubmissionSuccess) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyPages()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(size.width / 2.3, size.height / 15),
                      backgroundColor: Colors.orange,
                      shape: const StadiumBorder(),
                    ),
                    child: state.formStatus is FormSubmitting
                        ? const Center(child: CircularProgressIndicator())
                        : Text(
                            "next",
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
