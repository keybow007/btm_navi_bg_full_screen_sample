import 'package:flutter/material.dart';
import 'package:playground_3_7_12/pages/page_1.dart';
import 'package:playground_3_7_12/pages/page_2.dart';
import 'package:playground_3_7_12/pages/page_3.dart';
import 'package:playground_3_7_12/util/page_settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final currentPage = pages[_currentIndex];

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      //AppBarもここで動的に設定（子Pageではやらない）
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(currentPage.title),
        centerTitle: true,
        actions: currentPage.appBarActions,
      ),
      body: Container(
          decoration: BoxDecoration(
            //こんな感じでグラデーションつけてね
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black87, Colors.black26]),
            image: DecorationImage(
                image: AssetImage(currentPage.backgroundImagePath),
                fit: BoxFit.cover),
          ),
          child: currentPage.child),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Page1"),
          BottomNavigationBarItem(
              icon: Icon(Icons.baby_changing_station), label: "Page2"),
          BottomNavigationBarItem(icon: Icon(Icons.cabin), label: "Page3"),
        ],
        onTap: (selectedIndex) {
          setState(() {
            _currentIndex = selectedIndex;
          });
        },
      ),
    );
  }
}
