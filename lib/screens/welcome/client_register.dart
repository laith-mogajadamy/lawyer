import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/core/utils/formstatus.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/pages/pages.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/welcome/login.dart';
import 'package:lawyer/screens/widgets/black18text.dart';
import 'package:lawyer/screens/widgets/black16text.dart';
import 'package:lawyer/screens/widgets/imagepicker.dart';
import 'package:lawyer/screens/widgets/info_input.dart';

class ClientRegister extends StatefulWidget {
  const ClientRegister({super.key});

  @override
  State<ClientRegister> createState() => _ClientRegisterState();
}

class _ClientRegisterState extends State<ClientRegister> {
  String dropvalue = "select ";
  bool bottom = false;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController birth = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController eidnumber = TextEditingController();

  TextEditingController password = TextEditingController();
  TextEditingController retypePassword = TextEditingController();

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

    return BlocBuilder<EnterBloc, EnterState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar:
              (state.bottom) ? const Imagepicker() : const SizedBox.shrink(),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 25.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset("assets/images/logo.png"),
                  SizedBox(
                    height: 10.h,
                  ),
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
                            name: S.of(context).Gender,
                            hint: "Male",
                            validator: null,
                            onchange: (value) {
                              return context.read<EnterBloc>().add(
                                    GenderChanged(gender: value),
                                  );
                            },
                            controller: gender,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          InfoInput(
                            name: S.of(context).birth,
                            hint: "00-00-0000",
                            validator: null,
                            onchange: (value) {
                              return context.read<EnterBloc>().add(
                                    BirthChanged(birth: value),
                                  );
                            },
                            controller: birth,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          InfoInput(
                            name: S.of(context).Country,
                            hint: "UAE",
                            validator: null,
                            onchange: (value) {
                              return context.read<EnterBloc>().add(
                                    CountryChanged(country: value),
                                  );
                            },
                            controller: country,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          InfoInput(
                            name: S.of(context).City,
                            hint: "Abu Dhabi",
                            validator: null,
                            onchange: (value) {
                              return context.read<EnterBloc>().add(
                                    CityChanged(city: value),
                                  );
                            },
                            controller: city,
                          ),
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
                          SizedBox(
                            height: 20.h,
                          ),
                          InfoInput(
                              name: S.of(context).RetypePassword,
                              hint: "*******",
                              validator: (value) => state.isValidPassword
                                  ? null
                                  : S.of(context).passwordvalidate,
                              onchange: (value) =>
                                  context.read<EnterBloc>().add(
                                        LoginReTypePasswordChanged(
                                            retypePassword: value),
                                      ),
                              controller: retypePassword),
                          SizedBox(
                            height: 20.h,
                          ),
                          InfoInput(
                              name: S.of(context).EIDNumber,
                              hint: "78400000000",
                              validator: null,
                              onchange: (value) =>
                                  context.read<EnterBloc>().add(
                                        EidNumberChanged(eidnumber: value),
                                      ),
                              controller: eidnumber),
                          SizedBox(
                            height: 20.h,
                          ),
                          Black18text(text: S.of(context).UploadEID),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  bottom = !bottom;
                                  context.read<EnterBloc>().add(Bottomshow(
                                      bottom: bottom, destenation: "fronteid"));
                                },
                                child: (state.feid != null)
                                    ? SizedBox(
                                        height: size.height / 7,
                                        width: size.width / 2.5,
                                        child: Image.file(
                                          state.feid!,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : Column(
                                        children: [
                                          Icon(
                                            Icons.upload_file_sharp,
                                            size: 70.r,
                                            color: AppColor.offblack,
                                          ),
                                          Black18text(text: S.of(context).Front)
                                        ],
                                      ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  bottom = !bottom;
                                  context.read<EnterBloc>().add(Bottomshow(
                                      bottom: bottom, destenation: "backeid"));
                                },
                                child: (state.beid != null)
                                    ? SizedBox(
                                        height: size.height / 7,
                                        width: size.width / 2.5,
                                        child: Image.file(
                                          state.beid!,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : Column(
                                        children: [
                                          Icon(
                                            Icons.upload_file_sharp,
                                            size: 70.r,
                                            color: AppColor.offblack,
                                          ),
                                          Black18text(text: S.of(context).Back)
                                        ],
                                      ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
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
                                          fontSize: 14.sp, color: Colors.white),
                                    ),
                                  ),
                                );
                              }
                            },
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  if ((state.formStatus is FormSubmitting)) {
                                  } else {
                                    context
                                        .read<EnterBloc>()
                                        .add(ClientRegisterSubmitted());
                                  }
                                }

                                print(state.email);
                                print("=============");
                                print(state.name);
                                print("=============");
                                print(state.phone);
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
                                      S.of(context).SignUp,
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
