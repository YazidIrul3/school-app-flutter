import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/components/card/card-task-component.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

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
              'Tasks  ',
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
            CardTaskComponent(),
            CardTaskComponent(),
            CardTaskComponent(),
            CardTaskComponent(),
            CardTaskComponent(),
          ],
        ),
      ),
    );
  }
}
