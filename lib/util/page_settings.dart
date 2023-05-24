/*
* （要件）BottomNavigationBarを使う際に
*   １）Page毎に背景を変えてその背景を全画面表示させたい
*   ２）AppBarをPage毎に変えたい
*   => この要件を満たすために、各Pageの設定ファイルを作る
* */

import 'package:flutter/material.dart';
import 'package:playground_3_7_12/pages/page_1.dart';
import 'package:playground_3_7_12/pages/page_3.dart';

import '../pages/page_2.dart';

//並び順はBottomNavigationで表示させるPageの並び順に揃える
final pages = [
  Page(
      child: Page1(),
      title: "Page1",
      backgroundImagePath: "assets/images/back001.jpg",
      appBarActions: [
        IconButton(onPressed: () => print("Page1#add"), icon: Icon(Icons.add)),
      ]),
  Page(
      child: Page2(),
      title: "Page2",
      backgroundImagePath: "assets/images/back002.jpg",
      appBarActions: [
        IconButton(
            onPressed: () => print("Page2#edit"), icon: Icon(Icons.edit)),
        IconButton(
            onPressed: () => print("Page2#delete"), icon: Icon(Icons.delete)),
      ]),
  Page(
      child: Page3(),
      title: "Page3",
      backgroundImagePath: "assets/images/back003.jpg",
      appBarActions: [
        IconButton(
            onPressed: () => print("Page3#phone"), icon: Icon(Icons.phone)),
        IconButton(onPressed: () => print("Page3#fax"), icon: Icon(Icons.fax)),
      ]),
];

class Page {
  final Widget child;
  final String title;
  final String backgroundImagePath;
  final List<Widget> appBarActions;

  const Page({
    required this.child,
    required this.title,
    required this.backgroundImagePath,
    required this.appBarActions,
  });

  Page copyWith({
    Widget? pageWidget,
    String? title,
    String? backgroundImagePath,
    List<Widget>? appBarActions,
  }) {
    return Page(
      child: pageWidget ?? this.child,
      title: title ?? this.title,
      backgroundImagePath: backgroundImagePath ?? this.backgroundImagePath,
      appBarActions: appBarActions ?? this.appBarActions,
    );
  }
}
