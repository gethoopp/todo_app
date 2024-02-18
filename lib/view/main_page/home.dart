// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore: depend_on_referenced_packages
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:isar/isar.dart';
import 'package:todo_app/controller/controller.dart';
import 'package:todo_app/localdata/data.dart';

import 'package:todo_app/view/detail_menu/detail1.dart';
import 'package:todo_app/view/detail_menu/detail2.dart';
import 'package:todo_app/view/detail_menu/detail3.dart';
import 'package:todo_app/view/detail_menu/detail4.dart';
import 'package:todo_app/widget/dialog.dart';

class HomeScreen extends StatefulWidget {
  final Isar isar;

  const HomeScreen({
    super.key,
    required this.isar,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int bottomIndex = 0;
  List<IconData> iconns = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.calendar,
    FontAwesomeIcons.stopwatch,
    FontAwesomeIcons.personCirclePlus
  ];

  void updatePage(int value) {
    setState(() {
      bottomIndex = value;
    });
  }

  late List<Widget> indexPage;

  @override
  void initState() {
    super.initState();
    final isar = widget.isar;
    indexPage = [
      Detail1(
        isar: isar,
        key: const PageStorageKey('page1'),
      ),
      const Detail2(
        key: PageStorageKey('page2'),
      ),
      const Detail3(
        key: PageStorageKey('page3'),
      ),
      const Detail4(
        key: PageStorageKey('page4'),
      ),
    ];
  }

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageStorage(
        bucket: bucket,
        child: indexPage[bottomIndex],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(widget.isar.datas.count().toString());
          dialog(widget.isar, context, onchanged, time);
          print(time);
        },
        backgroundColor: Colors.blueGrey,
        hoverColor: Colors.green,
        splashColor: Colors.green,
        shape: const CircleBorder(),
        child: const FaIcon(FontAwesomeIcons.plus),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: animateBottom(bottomIndex, iconns, updatePage),
    );
  }
}

AnimatedBottomNavigationBar animateBottom(
    int bottomIndex, List<IconData> icons, Function(int value) updatePage) {
  return AnimatedBottomNavigationBar(
      activeColor: Colors.white,
      inactiveColor: Colors.white30,
      leftCornerRadius: 25,
      rightCornerRadius: 25,
      notchSmoothness: NotchSmoothness.sharpEdge,
      icons: icons,
      backgroundColor: Colors.white24,
      gapLocation: GapLocation.center,
      activeIndex: bottomIndex,
      onTap: updatePage);
}
