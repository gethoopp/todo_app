// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:isar/isar.dart';

import 'package:todo_app/controller/controller.dart';
import 'package:todo_app/view/intro_page/intro_page2.dart';
import 'package:todo_app/widget/intro.dart';

class Page1 extends StatefulWidget {
  final Isar isar;
  const Page1({super.key,required this.isar});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  // ignore: non_constant_identifier_names
  void UpdateState() {
    setState(() {
      setState(() {
        selectedIndex++;
        Get.offAll(Page2(isarl: widget.isar),transition: Transition.leftToRight);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: introMethod(size, UpdateState,
         buttontext: 'Next',
          images: 'Assets/image/im1.png',
          text: 'Manage Your Task',
          text1:
              'You can Easily Manage All of Your daily \n Task In DoMe For Free'),
    );
  }
}
