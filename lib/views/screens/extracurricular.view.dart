import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/components/card/card-extracurricular.component.dart';

class ExtracurricularView extends StatelessWidget {
  const ExtracurricularView({super.key});

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
              'Extracurricular',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          spacing: 10,
          children: [
            CardExtracurricularComponent(),
            CardExtracurricularComponent(),
            CardExtracurricularComponent(),
            CardExtracurricularComponent(),
            CardExtracurricularComponent(),
          ],
        ),
      ),
    );
  }
}
