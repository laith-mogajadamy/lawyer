import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/widgets/black22text.dart';
import 'package:lawyer/screens/widgets/consultation_card.dart';

class UserConsultationscomponent extends StatefulWidget {
  const UserConsultationscomponent({super.key});

  @override
  State<UserConsultationscomponent> createState() => _FilesPageState();
}

class _FilesPageState extends State<UserConsultationscomponent> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return BlocBuilder<EnterBloc, EnterState>(
      builder: (context, state) {
        if (state.user.consultations!.isNotEmpty) {
          return ListView.builder(
            itemCount: state.user.consultations!.length,
            itemBuilder: (context, index) {
              return ConsultationCard(
                  consultation: state.user.consultations![index]);
            },
          );
        } else {
          return Center(
            child: Black22text(text: S.of(context).youdonthaveanyconsultations),
          );
        }
      },
    );
  }
}
