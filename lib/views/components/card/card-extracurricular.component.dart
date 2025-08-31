import 'package:flutter/material.dart';

class CardExtracurricularComponent extends StatelessWidget {
  const CardExtracurricularComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            offset: Offset(1, 1),
            blurRadius: 4,
            spreadRadius: 0.3,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset('assets/neper1.jpg'),
          Text(
            'Basket',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
