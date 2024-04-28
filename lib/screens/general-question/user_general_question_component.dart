import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/widgets/black22text.dart';
import 'package:lawyer/screens/widgets/generalquestioncard.dart';

class UserGeneralquestioncomponent extends StatefulWidget {
  const UserGeneralquestioncomponent({super.key});

  @override
  State<UserGeneralquestioncomponent> createState() => _FilesPageState();
}

class _FilesPageState extends State<UserGeneralquestioncomponent> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return BlocBuilder<EnterBloc, EnterState>(
      builder: (context, state) {
        if (state.user.generalquestions!.isNotEmpty) {
          return ListView.builder(
            itemCount: state.user.generalquestions!.length,
            itemBuilder: (context, index) {
              return Generalquestioncard(
                genralqsttion: state.user.generalquestions![index],
              );
            },
          );
        } else {
          return Center(
            child:
                Black22text(text: S.of(context).youdonthaveanygeneralquestions),
          );
        }
      },
    );
  }
}
