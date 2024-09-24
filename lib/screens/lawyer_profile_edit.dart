import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/core/utils/formstatus.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/widgets/backe_id_change.dart';
import 'package:lawyer/screens/widgets/bio_input.dart';
import 'package:lawyer/screens/widgets/black18text.dart';
import 'package:lawyer/screens/widgets/black22text.dart';
import 'package:lawyer/screens/widgets/certification_field.dart';
import 'package:lawyer/screens/widgets/check_available.dart';
import 'package:lawyer/screens/widgets/fronte_id_change.dart';
import 'package:lawyer/screens/widgets/imagepicker.dart';
import 'package:lawyer/screens/widgets/info_input.dart';
import 'package:lawyer/screens/widgets/license_flield.dart';
import 'package:lawyer/screens/widgets/orange22text.dart';
import 'package:lawyer/screens/widgets/profile_image_change.dart';
import 'package:lawyer/screens/widgets/select_city.dart';
import 'package:lawyer/screens/widgets/select_country.dart';
import 'package:lawyer/screens/widgets/select_gender.dart';
import 'package:lawyer/screens/widgets/select_language.dart';
import 'package:lawyer/screens/widgets/select_practice.dart';

class LawyerProfileEdit extends StatefulWidget {
  const LawyerProfileEdit({super.key});

  @override
  State<LawyerProfileEdit> createState() => _LawyerProfileEditState();
}

class _LawyerProfileEditState extends State<LawyerProfileEdit> {
  bool bottom = false;
  final formKey = GlobalKey<FormState>();
  List<File> _certification = [];
  Future uploadpdf() async {
    FilePickerResult? results = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['pdf'], allowMultiple: true);
    print("result= $results");
    if (results == null) {
      return;
    }
    for (var i = 0; i < results.files.length; i++) {
      File file = File(results.files[i].path ?? "");
      print("file= $file");
      String filename = results.files[i].name;
      print("filename= $filename");
      String path = results.files[i].path!;
      print("path= $path");
      _certification.add(file);
    }
  }

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
  TextEditingController yearsofpractice = TextEditingController();
  TextEditingController facebook = TextEditingController();
  TextEditingController tiktok = TextEditingController();

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
                          InfoInput(
                              name: S.of(context).LandLine,
                              hint: state.user.phone.toString(),
                              validator: null,
                              onchange: null,
                              controller: landline),
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
                          const CertificationField(),
                          SizedBox(
                            height: 10.h,
                          ),
                          const LicenseFlield(),
                          SizedBox(
                            height: 10.h,
                          ),
                          InfoInput(
                              name: S.of(context).consultationprice,
                              hint: state.user.consultationPrice.toString(),
                              validator: null,
                              onchange: null,
                              controller: consultationprice),
                          SizedBox(
                            height: 20.h,
                          ),
                          InfoInput(
                            name: "${S.of(context).yearsOfPractice} :",
                            hint: "3",
                            validator: null,
                            onchange: null,
                            controller: yearsofpractice,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          const BioInput(),
                          SizedBox(
                            height: 20.h,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          const SelectPractice(),
                          SizedBox(
                            height: 20.h,
                          ),
                          const SelectLanguage(),
                          SizedBox(
                            height: 20.h,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          InfoInput(
                            name: "facebook :",
                            hint: "",
                            validator: null,
                            onchange: null,
                            controller: facebook,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          InfoInput(
                            name: "tiktok :",
                            hint: "",
                            validator: null,
                            onchange: null,
                            controller: tiktok,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          const CheckAvailablewidget(),
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
                                      LawyerProfiledit(
                                        fimage: state.fimage,
                                        name: name.text.trim(),
                                        email: email.text.trim(),
                                        number: number.text.trim(),
                                        birth: birth.text.trim(),
                                        location: state.selectedcoutry.name
                                            .toString(),
                                        gender:
                                            state.selectedgender.id.toString(),
                                        consultationPrice: int.parse(
                                            consultationprice.text.trim()),
                                        certification: _certification,
                                        available: state.available,
                                        frontemiratesid: state.feid,
                                        backemiratesid: state.beid,
                                        bio: state.biography,
                                        city: state.selectedcity.id.toString(),
                                        emiratesid: eidnumber.text,
                                        country:
                                            state.selectedcoutry.id.toString(),
                                        landline: landline.text,
                                        password: password.text,
                                        passwordconfirmation:
                                            retypePassword.text,
                                        licenses: state.license,
                                        practices: state.selectedpractices,
                                        languages: state.selectedlanguages,
                                        yearsofpractice:
                                            yearsofpractice.text.trim(),
                                        facebook: facebook.text.trim(),
                                        tiktok: tiktok.text.trim(),
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
