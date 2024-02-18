// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:isar/isar.dart';
import 'package:todo_app/welcome_board.dart';

import 'package:todo_app/widget/intro.dart';

class Page3 extends StatefulWidget {
  final Isar isar;
  
  const Page3({super.key, required this.isar,});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  // ignore: non_constant_identifier_names
  void UpdateState() {
    setState(() {
      setState(() {
        Get.to(WelcomeBoard(isar: widget.isar,),
            transition: Transition.leftToRight,
            curve: Curves.easeIn);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: introMethod(size, UpdateState,
          buttontext: 'Started',
          images: 'Assets/image/im3.png',
          text: 'Orgonaize your tasks',
          text1:
              'You can organize your daily tasks by  \n adding your tasks into separate categories'),
    );
  }
}
