import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/language_change.dart';
import 'package:lawyer/screens/welcome/login.dart';
import 'package:lawyer/screens/welcome/register.dart';

class Enter extends StatelessWidget {
  const Enter({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            opacity: 0.5,
            image: AssetImage(
              "assets/images/screen.jpg",
            ),
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LanguageChange(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.language,
                      size: 30.r,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                  width: size.width,
                  child: Image.asset("assets/images/logo.png")),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(size.width / 1.6, size.height / 18),
                      backgroundColor: AppColor.offblack,
                      shape: const BeveledRectangleBorder(),
                    ),
                    child: Text(
                      S.of(context).login,
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Register()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(size.width / 1.6, size.height / 18),
                      backgroundColor: AppColor.offblack,
                      shape: const BeveledRectangleBorder(),
                    ),
                    child: Text(
                      S.of(context).REGISTER,
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Text(
                S.of(context).ABOUTUS,
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
