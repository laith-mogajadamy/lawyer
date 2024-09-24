import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/generated/l10n.dart';
import 'package:lawyer/screens/welcome/controller/enter_bloc.dart';
import 'package:lawyer/screens/widgets/black18text.dart';
import 'package:lawyer/screens/widgets/certifications_input.dart';

class CertificationField extends StatelessWidget {
  const CertificationField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<EnterBloc, EnterState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Black18text(text: S.of(context).Certifications),
            SizedBox(
              height: 10.h,
            ),
            (state.certifications!.isEmpty)
                ? Row(
                    children: [
                      CertificationsInput(
                        ontap: () {
                          bool bottom = !state.bottom;
                          context.read<EnterBloc>().add(
                                Bottomshow(
                                    bottom: bottom,
                                    destenation: "Certifications"),
                              );
                        },
                      ),
                      CertificationsInput(
                        ontap: () {
                          bool bottom = !state.bottom;
                          context.read<EnterBloc>().add(
                                Bottomshow(
                                    bottom: bottom,
                                    destenation: "Certifications"),
                              );
                        },
                      ),
                      CertificationsInput(
                        ontap: () {
                          bool bottom = !state.bottom;
                          context.read<EnterBloc>().add(
                                Bottomshow(
                                    bottom: bottom,
                                    destenation: "Certifications"),
                              );
                        },
                      ),
                    ],
                  )
                : SizedBox(
                    height: size.height / 7,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.certifications!.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                bool bottom = !state.bottom;
                                context.read<EnterBloc>().add(
                                      Bottomshow(
                                          bottom: bottom,
                                          destenation: "Certifications"),
                                    );
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: SizedBox(
                                  height: size.height / 8,
                                  width: size.width / 2.5,
                                  child: Image.file(
                                    state.certifications![index],
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            (index == state.certifications!.length - 1)
                                ? CertificationsInput(
                                    ontap: () {
                                      bool bottom = !state.bottom;
                                      context.read<EnterBloc>().add(
                                            Bottomshow(
                                                bottom: bottom,
                                                destenation: "Certifications"),
                                          );
                                    },
                                  )
                                : const SizedBox.shrink()
                          ],
                        );
                      },
                    ),
                  ),
          ],
        );
      },
    );
  }
}
