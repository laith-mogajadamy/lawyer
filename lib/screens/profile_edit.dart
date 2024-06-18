import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/core/utils/formstatus.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/widgets/black22text.dart';
import 'package:lawyer/screens/widgets/imagepicker.dart';
import 'package:lawyer/screens/widgets/info_input.dart';
import 'package:lawyer/screens/widgets/orange22text.dart';
import 'package:lawyer/screens/widgets/pdf_widget.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  bool bottom = false;
  late EnterBloc _enterBloc;

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

  @override
  void initState() {
    _enterBloc = context.read<EnterBloc>();
    name.text = _enterBloc.state.user.name;
    email.text = _enterBloc.state.user.email;
    number.text = _enterBloc.state.user.phone;
    birth.text = _enterBloc.state.user.birth.toString();
    location.text = _enterBloc.state.user.country.toString();
    gender.text = _enterBloc.state.user.gender.toString();
    consultationprice.text = _enterBloc.state.user.consultationPrice.toString();

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
                  GestureDetector(
                    onTap: () {
                      bottom = !bottom;
                      context.read<EnterBloc>().add(Bottomshow(
                          bottom: bottom, destenation: "profileImage"));
                    },
                    child: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        (state.fimage != null)
                            ? Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.green, width: 3.w),
                                  borderRadius: BorderRadius.circular(100.r),
                                ),
                                child: CircleAvatar(
                                  radius: 75.r,
                                  backgroundImage: FileImage(state.fimage!),
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.green, width: 3.w),
                                  borderRadius: BorderRadius.circular(100.r),
                                ),
                                child: CircleAvatar(
                                  radius: 75.r,
                                  backgroundImage:
                                      NetworkImage(state.user.image),
                                ),
                              ),
                        Icon(
                          Icons.edit,
                          size: 30.r,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    child: Column(
                      children: [
                        InfoInput(
                            name: S.of(context).Name,
                            hint: "Client name",
                            validator: (value) => state.isValidName
                                ? null
                                : S.of(context).namevalidate,
                            onchange: null,
                            controller: name),
                        SizedBox(
                          height: 10.h,
                        ),
                        InfoInput(
                            name: S.of(context).email,
                            hint: "Client@gmail.com",
                            validator: (value) => state.isValidEmail
                                ? null
                                : S.of(context).emailvalidate,
                            onchange: null,
                            controller: email),
                        SizedBox(
                          height: 10.h,
                        ),
                        InfoInput(
                            name: S.of(context).Contactnumber,
                            hint: "000000000",
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
                            name: S.of(context).birth,
                            hint: "d/m/y",
                            validator: null,
                            onchange: null,
                            controller: birth),
                        SizedBox(
                          height: 20.h,
                        ),
                        InfoInput(
                            name: S.of(context).location,
                            hint: "0",
                            validator: null,
                            onchange: null,
                            controller: location),
                        SizedBox(
                          height: 20.h,
                        ),
                        InfoInput(
                            name: S.of(context).Gender,
                            hint: "male/female",
                            validator: null,
                            onchange: null,
                            controller: gender),
                        SizedBox(
                          height: 20.h,
                        ),
                        InfoInput(
                            name: S.of(context).consultationprice,
                            hint: "50",
                            validator: null,
                            onchange: null,
                            controller: consultationprice),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      uploadpdf().then(
                        (value) => context.read<EnterBloc>().add(
                              AddCertification(certifications: _certification),
                            ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(size.width / 2, size.height / 15),
                      backgroundColor: Colors.red,
                      shape: const StadiumBorder(),
                    ),
                    child: Text(
                      S.of(context).addcertification,
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  (state.certifications!.isEmpty)
                      ? const SizedBox.shrink()
                      : SizedBox(
                          height: size.height / 3,
                          child: ListView.builder(
                            itemCount: state.certifications!.length,
                            padding: const EdgeInsets.all(8),
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return PdfWidget(
                                  file: state.certifications![index]);
                            },
                          ),
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
                              Profiledit(
                                  fimage: state.fimage,
                                  name: name.text.trim(),
                                  email: email.text.trim(),
                                  number: number.text.trim(),
                                  birth: birth.text.trim(),
                                  location: int.parse(location.text.trim()),
                                  gender: int.parse(gender.text.trim()),
                                  consultationPrice:
                                      int.parse(consultationprice.text.trim()),
                                  certification: _certification),
                            );
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(size.width / 2.3, size.height / 15),
                        backgroundColor: Colors.orange,
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
