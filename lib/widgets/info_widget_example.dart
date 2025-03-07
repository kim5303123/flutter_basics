import 'package:flutter/material.dart';

class infoWidgetExample extends StatelessWidget {
  const infoWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "정보 표시 위젯 예제",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
