import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lawyer/screens/pages/pages.dart';
import 'package:lawyer/screens/welcome/login.dart';
import 'package:lawyer/screens/welcome/register.dart';
import 'package:lawyer/screens/widgets/black22text.dart';

class Enter extends StatelessWidget {
  const Enter({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: size.width,
              child: SvgPicture.asset(
                "assets/svg/Element-3.svg",
                height: size.height / 2,
                width: size.width,
              ),
            ),
            const Black22text(
              text: "BRIEFCASE",
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(size.width / 3, size.height / 17),
                  backgroundColor: Colors.orange,
                  shape: StadiumBorder(
                      side: BorderSide(color: Colors.black, width: 1.5.w))),
              child: Text(
                "LOGIN",
                style: TextStyle(
                    fontSize: 19.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyPages()),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(size.width / 3, size.height / 17),
                backgroundColor: Colors.orange,
                shape: StadiumBorder(
                  side: BorderSide(color: Colors.black, width: 1.5.w),
                ),
              ),
              child: Text(
                "GUEST",
                style: TextStyle(
                    fontSize: 19.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Register()),
                );
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(size.width / 3, size.height / 17),
                  backgroundColor: Colors.orange,
                  shape: StadiumBorder(
                      side: BorderSide(color: Colors.black, width: 1.5.w))),
              child: Text(
                "REGISTER",
                style: TextStyle(
                    fontSize: 17.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "ABOUT US",
              style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
