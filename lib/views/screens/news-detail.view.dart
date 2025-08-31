import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/repository/news.repo.dart';
import 'package:flutter_application_1/responses/news.response.dart';

class NewsDetailView extends StatefulWidget {
  final int id;
  const NewsDetailView({super.key, required this.id});

  @override
  State<NewsDetailView> createState() => _NewsDetailViewState();
}

class _NewsDetailViewState extends State<NewsDetailView> {
  var news;
  final newsRepo = NewsRepo();

  @override
  void initState() {
    super.initState();
    news = newsRepo.getDetailNews(id: widget.id);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Detail News',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),

      body: FutureBuilder<NewsDetailResponse>(
        future: newsRepo.getDetailNews(id: widget.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data?.data == null) {
            return const Center(child: Text('Data tidak ditemukan'));
          }

          final detail = snapshot.data!.data!;
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/neper1.jpg',
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.8,
                  fit: BoxFit.cover,
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      detail.title.toString(),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      detail.description.toString(),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
