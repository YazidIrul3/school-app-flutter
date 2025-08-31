import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/lesson.repo.dart';
import 'package:flutter_application_1/responses/lesson.response.dart';
import 'package:flutter_application_1/responses/list.response.dart';
import 'package:flutter_application_1/views/components/card/card-lesson.component.dart';

class MaterialView extends StatefulWidget {
  const MaterialView({super.key});

  @override
  State<MaterialView> createState() => _MaterialViewState();
}

class _MaterialViewState extends State<MaterialView> {
  final lessonRepo = LessonRepo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.all(20),
        toolbarHeight: 70,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Materials',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder<ListResponse<LessonResponse>>(
        future: lessonRepo.getLessons(),
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

          final data = snapshot.data;
          final lessonList = data?.data ?? [];

          if (lessonList.isEmpty) {
            return const Center(child: Text('Tidak ada berita'));
          }

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              spacing: 10,
              children: lessonList.map((lesson) {
                return CardLessonComponent(name: lesson.name.toString());
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
