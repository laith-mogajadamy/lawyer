import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/welcome/lawyer_register_2.dart';
import 'package:lawyer/screens/welcome/login.dart';
import 'package:lawyer/screens/welcome/translation_company_register2.dart';
import 'package:lawyer/screens/widgets/backe_id_change.dart';
import 'package:lawyer/screens/widgets/black18text.dart';
import 'package:lawyer/screens/widgets/black16text.dart';
import 'package:lawyer/screens/widgets/fronte_id_change.dart';
import 'package:lawyer/screens/widgets/imagepicker.dart';
import 'package:lawyer/screens/widgets/info_input.dart';
import 'package:lawyer/screens/widgets/profile_image_change.dart';
import 'package:lawyer/screens/widgets/select_city.dart';
import 'package:lawyer/screens/widgets/select_country.dart';
import 'package:lawyer/screens/widgets/select_gender.dart';

class TranslationCompanyRegister extends StatefulWidget {
  const TranslationCompanyRegister({super.key});

  @override
  State<TranslationCompanyRegister> createState() =>
      _TranslationCompanyRegisterState();
}

class _TranslationCompanyRegisterState
    extends State<TranslationCompanyRegister> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController landline = TextEditingController();

  TextEditingController gender = TextEditingController();
  TextEditingController birth = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController occupation = TextEditingController();

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
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          const ProfileImageChange(),
                          SizedBox(
                            height: 20.h,
                          ),
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
                              name: S.of(context).LandLine,
                              hint: "000000000",
                              validator: null,
                              onchange: (value) {
                                return context.read<EnterBloc>().add(
                                      LandLineChanged(landline: value),
                                    );
                              },
                              controller: landline),
                          SizedBox(
                            height: 20.h,
                          ),
                          const SelectCountry(),
                          SizedBox(
                            height: 20.h,
                          ),
                          const SelectCity(),
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
                          ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TranslationCompanyRegister2()),
                                );
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
                            child: Text(
                              S.of(context).Next,
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
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
