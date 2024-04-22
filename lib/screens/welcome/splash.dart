import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyer/screens/pages/pages.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/welcome/enter.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocListener<EnterBloc, EnterState>(
      listener: (context, state) {
        Future.delayed(
          const Duration(seconds: 2),
          () {
            if (state.islogedin == "true") {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyPages()),
              );
            } else if (state.islogedin == "false") {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Enter()),
              );
            }
          },
        );
      },
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Image.asset(
            "assets/images/splash2.jpeg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
