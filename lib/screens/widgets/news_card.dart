import 'package:flutter/material.dart';
import 'package:lawyer/models/news.dart';
import 'package:lawyer/screens/news/viwe_news_page.dart';
import 'package:lawyer/screens/widgets/black12text.dart';
import 'package:lawyer/screens/widgets/black16text.dart';
import 'package:lawyer/screens/widgets/graydivider.dart';

class NewsCard extends StatelessWidget {
  final NewsM news;
  const NewsCard({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    print(news.img);
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ViweNewsPage(
                  news: news,
                ),
              ),
            );
          },
          title: Black16text(text: news.title),
          subtitle: Black12text(text: news.shortDescription),
          trailing: Image.network(news.img),
        ),
        const Graydivider(),
      ],
    );
  }
}
