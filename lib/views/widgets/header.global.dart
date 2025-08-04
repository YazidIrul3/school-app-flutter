import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/screens/notification.view.dart';

class HeaderGlobal extends StatelessWidget implements PreferredSizeWidget {
  const HeaderGlobal({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      actionsPadding: EdgeInsets.all(20),
      toolbarHeight: 70,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/neper-logo.png', width: 40, height: 40),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationView(),
                ),
              );
            },
            icon: Icon(Icons.notifications, color: Colors.black),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
