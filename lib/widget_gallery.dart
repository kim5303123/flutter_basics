import 'package:flutter/material.dart';

class WidgetGallery extends StatefulWidget {
  final String title;

  const WidgetGallery({super.key, required this.title});

  @override
  State<WidgetGallery> createState() => _WidgetGalleryState();
}

class _WidgetGalleryState extends State<WidgetGallery> {
  //  상태 변수
  int _currentPageIndex = 0; //  선택된 탭 정보 상태

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Text(
          "위젯 갤러리",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        destinations: <Widget>[
          NavigationDestination(icon: Icon(Icons.keyboard), label: "입력"),
          NavigationDestination(icon: Icon(Icons.info), label: "정보 표시"),
          NavigationDestination(icon: Icon(Icons.animation), label: "애니메이션"),
        ],
      ),
    );
  }
}
