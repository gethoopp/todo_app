// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:todo_app/controller/controller.dart';
import 'package:todo_app/widget/intro.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  // ignore: non_constant_identifier_names
  void UpdateState() {
    setState(() {
      setState(() {
        selectedIndex++;
        Get.toNamed('/intro3');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: introMethod(size, UpdateState,
          buttontext: 'Next',
          images: 'Assets/image/im2.png',
          text: 'Create Daily Routine',
          text1:
              'In Uptodo  you can create your \n personalized routine to stay productive'),
    );
  }
}
