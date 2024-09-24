import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/core/utils/formstatus.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/widgets/backe_id_change.dart';
import 'package:lawyer/screens/widgets/black18text.dart';
import 'package:lawyer/screens/widgets/black22text.dart';
import 'package:lawyer/screens/widgets/fronte_id_change.dart';
import 'package:lawyer/screens/widgets/imagepicker.dart';
import 'package:lawyer/screens/widgets/info_input.dart';
import 'package:lawyer/screens/widgets/orange22text.dart';
import 'package:lawyer/screens/widgets/profile_image_change.dart';
import 'package:lawyer/screens/widgets/select_city.dart';
import 'package:lawyer/screens/widgets/select_country.dart';
import 'package:lawyer/screens/widgets/select_gender.dart';

class ClientProfileEdit extends StatefulWidget {
  const ClientProfileEdit({super.key});

  @override
  State<ClientProfileEdit> createState() => _ClientProfileEditState();
}

class _ClientProfileEditState extends State<ClientProfileEdit> {
  bool bottom = false;
  final formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController birth = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController consultationprice = TextEditingController();
  TextEditingController landline = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController occupation = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController retypePassword = TextEditingController();
  TextEditingController eidnumber = TextEditingController();

  @override
  void initState() {
    super.initState();
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Black22text(text: "BRIEFCASE"),
                        Orange22text(text: S.of(context).ProfileEdit),
                      ],
                    ),
                    const ProfileImageChange(),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                      child: Column(
                        children: [
                          InfoInput(
                              name: S.of(context).Name,
                              hint: state.user.name,
                              validator: (value) => state.isValidName
                                  ? null
                                  : S.of(context).namevalidate,
                              onchange: null,
                              controller: name),
                          SizedBox(
                            height: 20.h,
                          ),
                          InfoInput(
                              name: S.of(context).Emailaddress,
                              hint: state.user.email,
                              validator: (value) => state.isValidEmail
                                  ? null
                                  : S.of(context).emailvalidate,
                              onchange: null,
                              controller: email),
                          SizedBox(
                            height: 20.h,
                          ),
                          InfoInput(
                              name: S.of(context).Contactnumber,
                              hint: state.user.phone.toString(),
                              validator: (value) {
                                return state.isValidnumber
                                    ? null
                                    : S.of(context).numbervalidate;
                              },
                              onchange: null,
                              controller: number),
                          SizedBox(
                            height: 20.h,
                          ),
                          const SelectGender(),
                          SizedBox(
                            height: 20.h,
                          ),
                          InfoInput(
                            name: S.of(context).birth,
                            hint: state.user.birth.toString(),
                            validator: null,
                            onchange: null,
                            controller: birth,
                          ),
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
                            name: S.of(context).Occupation,
                            hint: state.user.occupation,
                            validator: null,
                            onchange: null,
                            controller: occupation,
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
                              onchange: null,
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
                              onchange: null,
                              controller: retypePassword),
                          SizedBox(
                            height: 20.h,
                          ),
                          InfoInput(
                              name: S.of(context).EIDNumber,
                              hint: state.user.emiratesId.toString(),
                              validator: null,
                              onchange: null,
                              controller: eidnumber),
                          SizedBox(
                            height: 20.h,
                          ),
                          Black18text(text: S.of(context).UploadEID),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FronteIdChange(),
                              BackeIdChange(),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          BlocListener<EnterBloc, EnterState>(
                            listenWhen: (previous, current) {
                              return previous.editStatus != current.editStatus;
                            },
                            listener: (context, state) {
                              if (state.editStatus is SubmissionSuccess) {
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
                                Navigator.of(context).pop();
                              } else if (state.editStatus is SubmissionFailed) {
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
                                context.read<EnterBloc>().add(
                                      ClientProfiledit(
                                        fimage: state.fimage,
                                        name: name.text.trim(),
                                        email: email.text.trim(),
                                        number: number.text.trim(),
                                        birth: birth.text.trim(),
                                        gender:
                                            state.selectedgender.id.toString(),
                                        frontemiratesid: state.feid,
                                        backemiratesid: state.beid,
                                        city: state.selectedcity.id.toString(),
                                        emiratesid: eidnumber.text,
                                        country:
                                            state.selectedcoutry.id.toString(),
                                        password: password.text,
                                        passwordconfirmation:
                                            retypePassword.text,
                                        occupation: occupation.text.trim(),
                                      ),
                                    );
                              },
                              style: ElevatedButton.styleFrom(
                                fixedSize:
                                    Size(size.width / 2.3, size.height / 15),
                                backgroundColor: AppColor.offblack,
                                shape: const StadiumBorder(),
                              ),
                              child: (state.editStatus is FormSubmitting)
                                  ? CircularProgressIndicator(
                                      color: AppColor.whiteColor,
                                      strokeWidth: 2.w,
                                    )
                                  : Text(
                                      S.of(context).save,
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        );
      },
    );
  }
}
