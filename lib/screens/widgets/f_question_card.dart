import 'package:flutter/material.dart';
import 'package:lawyer/models/fquestion.dart';
import 'package:lawyer/models/news.dart';
import 'package:lawyer/screens/general-question/f_question_view_page.dart';
import 'package:lawyer/screens/news/viwe_news_page.dart';
import 'package:lawyer/screens/widgets/black12text.dart';
import 'package:lawyer/screens/widgets/black16text.dart';
import 'package:lawyer/screens/widgets/graydivider.dart';

class FQuestionCard extends StatelessWidget {
  final FQuestion fquestion;
  const FQuestionCard({
    super.key,
    required this.fquestion,
  });

  @override
  Widget build(BuildContext context) {
    print(fquestion.img);
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ViweFQuestionPage(
                  fquestion: fquestion,
                ),
              ),
            );
          },
          title: Black16text(text: fquestion.question),
          subtitle: Black12text(text: fquestion.answer),
        ),
        const Graydivider(),
      ],
    );
  }
}
