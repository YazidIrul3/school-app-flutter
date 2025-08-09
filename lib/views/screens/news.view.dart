import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/news.repo.dart';
import 'package:flutter_application_1/responses/news.response.dart';
import 'package:flutter_application_1/responses/pagination.response.dart';
import 'package:flutter_application_1/views/components/card/card-news.component.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  final newsRepo = NewsRepo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<PaginationResponse<NewsResponse>>(
        future: newsRepo.getNews(page: 1),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            debugPrint('NewsView Error: ${snapshot.error}');
            return const Center(
              child: Text('Terjadi kesalahan saat memuat berita'),
            );
          }

          final pagination = snapshot.data;
          final newsList = pagination?.data ?? [];

          if (newsList.isEmpty) {
            return const Center(child: Text('Tidak ada berita'));
          }

          return ScrollConfiguration(
            behavior: ScrollBehavior().copyWith(overscroll: false),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                spacing: 13,
                children: newsList.map((news) {
                  return CardNewsComponent(
                    title: news.title.toString(),
                    author: news.author?.username ?? '',
                    date: news.date_published.toString(),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
