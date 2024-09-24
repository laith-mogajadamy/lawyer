import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lawyer/core/utils/appcolors.dart';
import 'package:lawyer/core/utils/prefrences.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/chat/controller/chat_bloc.dart';
import 'package:lawyer/screens/consultation/controller/consultation_bloc.dart';
import 'package:lawyer/screens/general-question/controller/generalquestion_bloc.dart';
import 'package:lawyer/screens/lawyers_and_translation_company/controller/lawyers_bloc.dart';
import 'package:lawyer/screens/news/controller/news_bloc.dart';
import 'package:lawyer/screens/search/controller/search_bloc.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<EnterBloc>(
          create: (context) => EnterBloc()..add(Getuser()),
        ),
        BlocProvider<ChatBloc>(
          create: (context) => ChatBloc(),
        ),
        BlocProvider<ConsultationBloc>(
          create: (context) => ConsultationBloc(),
        ),
        BlocProvider<GeneralquestionBloc>(
          create: (context) => GeneralquestionBloc(),
        ),
        BlocProvider<LawyersBloc>(
          create: (context) => LawyersBloc(),
        ),
        BlocProvider<SearchBloc>(
          create: (context) => SearchBloc(),
        ),
        BlocProvider<NewsBloc>(
          create: (context) => NewsBloc()
            ..add(
              GetNews(),
            ),
        ),
      ],
      child: BlocBuilder<EnterBloc, EnterState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(393, 786),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (BuildContext context, Widget? child) {
              return MaterialApp(
                locale: Locale(state.language),
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                debugShowCheckedModeBanner: false,
                title: 'BRIEFCASE',
                theme: ThemeData(
                  cardColor: Colors.white,
                  scaffoldBackgroundColor: AppColor.whiteColor,
                  cardTheme: const CardTheme(color: Colors.white),
                  canvasColor: Colors.transparent,
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: Colors.black,
                    primary: Colors.black,
                  ),
                  useMaterial3: true,
                ),
                home: const Splash(),
              );
            },
          );
        },
      ),
    );
  }
}
