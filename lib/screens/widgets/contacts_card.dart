import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/models/lawyer.dart';
import 'package:lawyer/screens/lawyers_and_translation_company/controller/lawyers_bloc.dart';
import 'package:lawyer/screens/widgets/black18text.dart';

class ContactsCard extends StatelessWidget {
  final Lawyer lawyer;
  const ContactsCard({
    super.key,
    required this.lawyer,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<LawyersBloc, LawyersState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            (state.selecte)
                ? context.read<LawyersBloc>().add(
                      CheckLawyer(
                        lawyer: lawyer,
                        check: (state.selectedlawyers.contains(lawyer))
                            ? false
                            : true,
                      ),
                    )
                : null;
          },
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: size.height / 12,
                    width: size.width / 6,
                    child: Image.network(
                      lawyer.profile,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Black18text(text: lawyer.name),
                ],
              ),
              (state.selecte)
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          width: 1,
                          color: Colors.black,
                        ),
                      ),
                      child: CircleAvatar(
                          radius: 13.r,
                          backgroundColor: Colors.transparent,
                          child: (state.selectedlawyers.contains(lawyer))
                              ? const Icon(
                                  Icons.check,
                                  color: Colors.black,
                                )
                              : null),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        );
      },
    );
  }
}
