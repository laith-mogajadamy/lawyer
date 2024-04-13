import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/widgets/black18text.dart';
import 'package:lawyer/screens/widgets/black22text.dart';
import 'package:lawyer/screens/widgets/info_input.dart';
import 'package:lawyer/screens/widgets/orange22text.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  bool bottom = false;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController birth = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController consultationprice = TextEditingController();

  final formKey = GlobalKey<FormState>();
  List<File> _certification = [];
  File? fimage;

  Future pickimage(ImageSource source) async {
    try {
      final Image = await ImagePicker().pickImage(source: source);
      if (Image == null) {
        return null;
      }
      final imagetemp = File(Image.path);
      fimage = imagetemp;
    } on PlatformException catch (e) {
      print("failed to pick image$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<EnterBloc, EnterState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: (state.bottom)
              ? Container(
                  height: size.height / 8,
                  width: size.width,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: AppColor.appgray,
                          blurRadius: 3.r,
                          spreadRadius: 3.r)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Black18text(text: "Gallery"),
                          GestureDetector(
                            onTap: () {
                              pickimage(ImageSource.gallery).then(
                                (value) => context.read<EnterBloc>().add(
                                      ImageChange(fimage: fimage),
                                    ),
                              );
                              bottom = !bottom;
                              context
                                  .read<EnterBloc>()
                                  .add(Bottomshow(bottom: bottom));
                            },
                            child: SizedBox(
                              height: size.height / 11,
                              width: size.width / 5,
                              child: SvgPicture.asset(
                                "assets/svg/gallery.svg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Black18text(text: "Camera"),
                          GestureDetector(
                            onTap: () {
                              pickimage(ImageSource.camera).then(
                                (value) => context.read<EnterBloc>().add(
                                      ImageChange(fimage: fimage),
                                    ),
                              );
                              bottom = !bottom;
                              context
                                  .read<EnterBloc>()
                                  .add(Bottomshow(bottom: bottom));
                            },
                            child: SizedBox(
                              height: size.height / 11,
                              width: size.width / 5,
                              child: SvgPicture.asset(
                                "assets/svg/camera.svg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
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
                      Orange22text(text: "Profile Edit"),
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        bottom = !bottom;
                        context
                            .read<EnterBloc>()
                            .add(Bottomshow(bottom: bottom));
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
                                    backgroundImage: NetworkImage(state.image),
                                  ),
                                ),
                          Icon(
                            Icons.edit,
                            size: 30.r,
                          ),
                        ],
                      )),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    child: Column(
                      children: [
                        InfoInput(
                            name: "Name/Company",
                            hint: "Client name",
                            validator: (value) =>
                                state.isValidName ? null : "name is too short",
                            onchange: null,
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
                            onchange: null,
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
                            onchange: null,
                            controller: number),
                        SizedBox(
                          height: 20.h,
                        ),
                        InfoInput(
                            name: "birth",
                            hint: "d/m/y",
                            validator: null,
                            onchange: null,
                            controller: birth),
                        SizedBox(
                          height: 20.h,
                        ),
                        InfoInput(
                            name: "location",
                            hint: "0",
                            validator: null,
                            onchange: null,
                            controller: location),
                        SizedBox(
                          height: 20.h,
                        ),
                        InfoInput(
                            name: "gender",
                            hint: "male/female",
                            validator: null,
                            onchange: null,
                            controller: gender),
                        SizedBox(
                          height: 20.h,
                        ),
                        InfoInput(
                            name: "consultation price",
                            hint: "50",
                            validator: null,
                            onchange: null,
                            controller: consultationprice),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      uploadpdf();
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(size.width / 2, size.height / 15),
                      backgroundColor: Colors.red,
                      shape: const StadiumBorder(),
                    ),
                    child: Text(
                      "add certification",
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  (_certification.isEmpty)
                      ? const SizedBox.shrink()
                      : SizedBox(
                          height: size.height / 4,
                          child: ListView.builder(
                            itemCount: _certification.length,
                            padding: const EdgeInsets.all(8),
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Material(
                                  elevation: 5,
                                  child: Container(
                                    width: size.width / 2,
                                    decoration: const BoxDecoration(
                                        color: AppColor.appgray),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<EnterBloc>().add(
                            Profiledit(
                                fimage: fimage,
                                name: name.text.trim(),
                                email: email.text.trim(),
                                number: number.text.trim(),
                                birth: birth.text.trim(),
                                location: int.parse(location.text.trim()),
                                gender: int.parse(gender.text.trim()),
                                consultationPrice:
                                    consultationprice.text.trim(),
                                certification: _certification),
                          );

                      print(state.email);
                      print("=============");
                      print(state.name);
                      print("=============");
                      print(state.number);
                      print("=============");
                      print(state.password);
                      print("=============");
                      print(state.id);
                      print("=============");
                      print(state.formStatus);
                      print(state.token);
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(size.width / 2.3, size.height / 15),
                      backgroundColor: Colors.orange,
                      shape: const StadiumBorder(),
                    ),
                    child: Text(
                      "save",
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
        );
      },
    );
  }

  Future uploadpdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    print("result= $result");
    if (result == null) {
      return;
    }

    File file = File(result.files.single.path ?? "");
    print("file= $file");
    String filename = result.files.single.name;
    print("filename= $filename");
    String path = file.path;
    print("path= $path");
    setState(() {
      _certification.add(file);
    });
  }
}
