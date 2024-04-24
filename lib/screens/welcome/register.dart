import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/core/utils/formstatus.dart';
import 'package:lawyer/screens/pages/pages.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
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
      "Legal consultant",
      "Typing center",
      "Client"
    ];

    List<DropdownMenuItem> clients = [];
    for (var i = 0; i < types.length; i++) {
      clients.add(
        DropdownMenuItem(
          value: (i + 1).toString(),
          alignment: AlignmentDirectional.bottomCenter,
          child: Container(
            width: size.width / 2,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black, width: 1.h),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
              child: Black18text(text: types[i]),
            ),
          ),
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
                image: AssetImage(
                  "assets/images/screen.jpg",
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 25.h),
              child: SingleChildScrollView(
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
                                name: "Name/Company",
                                hint: "Client name",
                                validator: (value) => state.isValidName
                                    ? null
                                    : "name is too short",
                                onchange: (value) =>
                                    context.read<EnterBloc>().add(
                                          LoginNameChanged(name: value),
                                        ),
                                controller: name),
                            SizedBox(
                              height: 20.h,
                            ),
                            InfoInput(
                                name: "Email address",
                                hint: "Client@gmail.com",
                                validator: (value) => state.isValidEmail
                                    ? null
                                    : "Email is too short",
                                onchange: (value) =>
                                    context.read<EnterBloc>().add(
                                          LoginEmailChanged(email: value),
                                        ),
                                controller: email),
                            SizedBox(
                              height: 20.h,
                            ),
                            InfoInput(
                                name: "Contact number",
                                hint: "000000000",
                                validator: (value) {
                                  return state.isValidnumber
                                      ? null
                                      : "number is too short";
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
                                name: "Password",
                                hint: "*******",
                                validator: (value) => state.isValidPassword
                                    ? null
                                    : 'Password is too short',
                                onchange: (value) =>
                                    context.read<EnterBloc>().add(
                                          LoginPasswordChanged(password: value),
                                        ),
                                controller: password),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.w, vertical: 20.h),
                              child: Container(
                                width: size.width / 1.9,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 1.h),
                                  ),
                                ),
                                child: DropdownButton(
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    size: 35.r,
                                    color: Colors.black,
                                  ),
                                  alignment: Alignment.center,
                                  dropdownColor: Colors.white,
                                  underline: const SizedBox(
                                    width: 0,
                                    height: 0,
                                  ),
                                  elevation: 10,
                                  borderRadius: BorderRadius.circular(20.r),
                                  hint: Text(
                                    (state.type.isEmpty)
                                        ? "select"
                                        : types[int.parse(state.type) - 1],
                                    style: TextStyle(
                                        fontSize: 18.sp, color: Colors.black),
                                  ),
                                  items: clients,
                                  isExpanded: true,
                                  onChanged: (v) {
                                    context.read<EnterBloc>().add(
                                          TypeChanged(type: v),
                                        );
                                  },
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
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.white),
                                      ),
                                    ),
                                  );
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const MyPages()),
                                  );
                                } else if (state.formStatus
                                    is SubmissionFailed) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.red,
                                      duration: const Duration(seconds: 2),
                                      content: Text(
                                        state.message,
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.white),
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    context
                                        .read<EnterBloc>()
                                        .add(RegisterSubmitted());
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
                                  fixedSize:
                                      Size(size.width / 1.2, size.height / 18),
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
                    ),
                    SizedBox(
                      height: size.height / 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Black16text(text: "Already have an account?"),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Login(),
                                ),
                              );
                            },
                            child: const Black18text(text: "Log In"))
                      ],
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
