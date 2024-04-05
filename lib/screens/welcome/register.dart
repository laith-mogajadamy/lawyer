import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/formstatus.dart';
import 'package:lawyer/screens/pages/pages.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/widgets/black18text.dart';
import 'package:lawyer/screens/widgets/black22text.dart';
import 'package:lawyer/screens/widgets/orange22text.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String dropvalue = "select ";
  String massege = " ";
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
          child: Container(
            width: size.width / 2,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 246, 238, 161),
                borderRadius: BorderRadius.circular(20.r)),
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
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 25.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                      Black22text(text: "BRIEFCASE"),
                      Orange22text(text: "REGISTERATION"),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Black22text(text: "Name/Company"),
                              SizedBox(
                                width: size.width / 2,
                                child: TextFormField(
                                  controller: name,
                                  validator: (value) => state.isValidUsername
                                      ? null
                                      : "name is too short",
                                  onChanged: (value) =>
                                      context.read<EnterBloc>().add(
                                            LoginNameChanged(name: value),
                                          ),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18.sp),
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    fillColor: const Color.fromARGB(
                                        255, 253, 242, 150),
                                    filled: true,
                                    hintText: "Client name",
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
                            height: 20.h,
                          ),
                          Row(
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
                                      : "Email is too short",
                                  onChanged: (value) =>
                                      context.read<EnterBloc>().add(
                                            LoginEmailChanged(email: value),
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
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                  child: Black22text(text: "Contact number")),
                              SizedBox(
                                width: size.width / 2,
                                child: TextFormField(
                                  controller: number,
                                  validator: (value) => state.isValidnumber
                                      ? null
                                      : "number is too short",
                                  onChanged: (value) =>
                                      context.read<EnterBloc>().add(
                                            LoginNumberChanged(number: value),
                                          ),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18.sp),
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    fillColor: const Color.fromARGB(
                                        255, 253, 242, 150),
                                    filled: true,
                                    hintText: "000000000",
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
                            height: 20.h,
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
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: 10.h),
                            child: Container(
                              width: size.width / 1.9,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 246, 238, 161),
                                  borderRadius: BorderRadius.circular(20.r)),
                              child: DropdownButton(
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    size: 35.r,
                                    color: Colors.orange,
                                  ),
                                  alignment: Alignment.center,
                                  dropdownColor: Colors.orange,
                                  underline: const SizedBox(
                                    width: 0,
                                    height: 0,
                                  ),
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
                                  }),
                            ),
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
                        if (formKey.currentState!.validate()) {
                          context.read<EnterBloc>().add(RegisterSubmitted());
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
          ),
        );
      },
    );
  }
}
// Column(
//   children: [
//     const Padding(
//       padding: EdgeInsets.symmetric(horizontal: 10),
//       child: Row(
//         children: [Black18text(text: "10AED")],
//       ),
//     ),
//     Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: SizedBox(
//         width: size.width / 1.2,
//         height: size.height / 14,
//         child: Form(
//           child: TextFormField(
//             controller: name,
//             style: TextStyle(color: Colors.black, fontSize: 18.sp),
//             cursorColor: Colors.black,
//             decoration: InputDecoration(
//               fillColor: const Color.fromARGB(255, 253, 242, 150),
//               filled: true,
//               hintText: "Card holder name",
//               hintStyle:
//                   TextStyle(color: Colors.grey, fontSize: 16.sp),
//               border: OutlineInputBorder(
//                 borderSide: BorderSide.none,
//                 borderRadius: BorderRadius.circular(
//                   30.r,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     ),
//     Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: SizedBox(
//         width: size.width / 1.2,
//         height: size.height / 14,
//         child: Form(
//           child: TextFormField(
//             controller: name,
//             style: TextStyle(color: Colors.black, fontSize: 18.sp),
//             cursorColor: Colors.black,
//             decoration: InputDecoration(
//               fillColor: const Color.fromARGB(255, 253, 242, 150),
//               filled: true,
//               hintText: "Card number",
//               hintStyle:
//                   TextStyle(color: Colors.grey, fontSize: 16.sp),
//               border: OutlineInputBorder(
//                 borderSide: BorderSide.none,
//                 borderRadius: BorderRadius.circular(
//                   30.r,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     ),
//     Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: SizedBox(
//             width: size.width / 3,
//             height: size.height / 14,
//             child: Form(
//               child: TextFormField(
//                 controller: name,
//                 style:
//                     TextStyle(color: Colors.black, fontSize: 18.sp),
//                 cursorColor: Colors.black,
//                 decoration: InputDecoration(
//                   fillColor:
//                       const Color.fromARGB(255, 253, 242, 150),
//                   filled: true,
//                   hintText: "MM/YY",
//                   hintStyle: TextStyle(
//                       color: Colors.grey, fontSize: 16.sp),
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide.none,
//                     borderRadius: BorderRadius.circular(
//                       30.r,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: SizedBox(
//             width: size.width / 3,
//             height: size.height / 14,
//             child: Form(
//               child: TextFormField(
//                 controller: name,
//                 style:
//                     TextStyle(color: Colors.black, fontSize: 18.sp),
//                 cursorColor: Colors.black,
//                 decoration: InputDecoration(
//                   fillColor:
//                       const Color.fromARGB(255, 253, 242, 150),
//                   filled: true,
//                   hintText: "000",
//                   hintStyle: TextStyle(
//                       color: Colors.grey, fontSize: 16.sp),
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide.none,
//                     borderRadius: BorderRadius.circular(
//                       30.r,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   ],
// ),
