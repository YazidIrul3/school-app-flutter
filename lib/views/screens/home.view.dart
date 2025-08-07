import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/global.colors.dart';
import 'package:flutter_application_1/utils/global.session.dart';
import 'package:flutter_application_1/views/components/card/card-box.component.dart';
import 'package:flutter_application_1/views/screens/login.view.dart';
import 'package:flutter_application_1/views/screens/news.view.dart';
import 'package:flutter_application_1/views/screens/profile.view.dart';
import 'package:flutter_application_1/views/screens/schedule.view.dart';
import 'package:flutter_application_1/views/widgets/bottom-navigation.global.dart';
import 'package:flutter_application_1/views/widgets/header.global.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final token = GlobalSession().getAccessToken();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: HeaderGlobal(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    offset: Offset(1, 2),
                    spreadRadius: 2,
                  ),
                ],
              ),

              child: token == null || token == ''
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Silahkan login untuk mengakses fitur'),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginView(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.account_box_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  : SizedBox(),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200.0,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: [1, 2, 3, 4, 5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(color: Colors.amber),
                          );
                        },
                      );
                    }).toList(),
                  ),

                  SizedBox(height: 30),

                  Row(
                    children: [
                      Text(
                        "Features",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                        ),
                      ),
                    ],
                  ),
                  GridView.count(
                    crossAxisCount: 3, // jumlah kolom
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                    shrinkWrap: true,
                    physics:
                        NeverScrollableScrollPhysics(), // biar tidak scroll sendiri dalam scrollview
                    children: [
                      CardBoxComponent(
                        text: 'Tugas',
                        asset: 'schedule-icon.png',
                      ),
                      CardBoxComponent(
                        text: 'Jadwal',
                        asset: 'schedule-icon.png',
                      ),
                      CardBoxComponent(
                        text: 'Pekerjaan Rumah',
                        asset: 'schedule-icon.png',
                      ),
                      CardBoxComponent(
                        text: 'Materi',
                        asset: 'schedule-icon.png',
                      ),
                      CardBoxComponent(text: 'PR', asset: 'schedule-icon.png'),
                      CardBoxComponent(
                        text: 'Kegiatan',
                        asset: 'schedule-icon.png',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
