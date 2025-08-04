import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/components/card/card-news.component.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          spacing: 10,
          children: [
            CardNewsComponent(),
            CardNewsComponent(),
            CardNewsComponent(),
          ],
        ),
      ),
    );
  }
}
