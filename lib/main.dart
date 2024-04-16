import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/core/utils/prefrences.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/screens/welcome/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EnterBloc()..add(Getuser()),
      child: ScreenUtilInit(
          designSize: const Size(393, 786),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (BuildContext context, Widget? child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                // Notice that the counter didn't reset back to zero; the application
                // state is not lost during the reload. To reset the state, use hot
                // restart instead.
                //
                // This works for code too, not just values: Most code changes can be
                // tested with just a hot reload.
                colorScheme:
                    ColorScheme.fromSeed(seedColor: AppColor.apporange),
                useMaterial3: true,
              ),
              home: const Splash(),
            );
          }),
    );
  }
}
