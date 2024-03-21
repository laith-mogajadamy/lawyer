import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/screens/pages/pages.dart';
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
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController password = TextEditingController();
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
    List<DropdownMenuItem> clients = [
      DropdownMenuItem(
        value: "Lawyer",
        child: Container(
          width: size.width / 2,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 246, 238, 161),
              borderRadius: BorderRadius.circular(20.r)),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Black18text(text: "Lawyer"),
          ),
        ),
      ),
      DropdownMenuItem(
        value: "Legal consultant",
        child: Container(
          width: size.width / 2,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 246, 238, 161),
              borderRadius: BorderRadius.circular(20.r)),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Black18text(text: "Legal consultant"),
          ),
        ),
      ),
      DropdownMenuItem(
        value: "Typing center",
        child: Container(
          width: size.width / 2,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 246, 238, 161),
              borderRadius: BorderRadius.circular(20.r)),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Black18text(text: "Typing center"),
          ),
        ),
      ),
      DropdownMenuItem(
        value: "Client",
        child: Container(
          width: size.width / 2,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 246, 238, 161),
              borderRadius: BorderRadius.circular(20.r)),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Black18text(text: "Client"),
          ),
        ),
      ),
    ];

    return Scaffold(
      body: SafeArea(
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
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Black22text(text: "Name/Company"),
                      SizedBox(
                        height: size.height / 16,
                        width: size.width / 2,
                        child: Form(
                            child: TextFormField(
                          controller: name,
                          style:
                              TextStyle(color: Colors.black, fontSize: 18.sp),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            fillColor: const Color.fromARGB(255, 253, 242, 150),
                            filled: true,
                            hintText: "Client name",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 16.sp),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(
                                30.r,
                              ),
                            ),
                          ),
                        )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(child: Black22text(text: "Email address")),
                      SizedBox(
                        height: size.height / 16,
                        width: size.width / 2,
                        child: Form(
                            child: TextFormField(
                          controller: email,
                          style:
                              TextStyle(color: Colors.black, fontSize: 18.sp),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            fillColor: const Color.fromARGB(255, 253, 242, 150),
                            filled: true,
                            hintText: "Client@gmail.com",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 16.sp),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(
                                30.r,
                              ),
                            ),
                          ),
                        )),
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
                          child: Black22text(text: "Contact number")),
                      SizedBox(
                        height: size.height / 16,
                        width: size.width / 2,
                        child: Form(
                          child: TextFormField(
                            controller: number,
                            style:
                                TextStyle(color: Colors.black, fontSize: 18.sp),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              fillColor:
                                  const Color.fromARGB(255, 253, 242, 150),
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
                      const SizedBox(child: Black22text(text: "Password")),
                      SizedBox(
                        height: size.height / 16,
                        width: size.width / 2,
                        child: Form(
                          child: TextFormField(
                            controller: password,
                            style:
                                TextStyle(color: Colors.black, fontSize: 18.sp),
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
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: size.width / 1.9,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 246, 238, 161),
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
                          dropvalue,
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.black),
                        ),
                        items: clients,
                        isExpanded: true,
                        onChanged: (v) {
                          setState(() {
                            dropvalue = v;
                          });
                        }),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyPages()),
                );
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
          ],
        ),
      ),
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