// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isar/isar.dart';
import 'package:todo_app/view/login_regis/login.dart';
import 'package:todo_app/view/login_regis/regis.dart';

class WelcomeBoard extends StatelessWidget {
  final Isar isar;
  

  const WelcomeBoard({super.key,required this.isar,});

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 30),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back))
              ],
            ),
          ),
          Animate(
            effects: const [
              FadeEffect(duration: Duration(seconds: 1), curve: Curves.easeIn),
              SlideEffect(curve: Curves.bounceInOut)
            ],
            child: Padding(
              padding: EdgeInsets.only(top: size.height * 0.15),
              child: Text(
                'Welcome To UpTodo',
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Animate(
            effects: const [
              FadeEffect(
                curve: Curves.easeIn,
                duration: Duration(seconds: 1),
              ),
              SlideEffect(curve: Curves.bounceInOut)
            ],
            child: const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                'Please login to your account or create \n new account to continue',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Animate(
            effects: const [
              FadeEffect(duration: Duration(seconds: 1)),
              SlideEffect(begin: Offset(0, 0.5), curve: Curves.bounceInOut)
            ],
            child: Padding(
              padding: EdgeInsets.only(top: size.height * 0.4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 327,
                      height: 48,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blueGrey),
                              shape: MaterialStateProperty.all(
                                  const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))))),
                          onPressed: () {
                            Get.to( () => Login(isar: isar, ), transition: Transition.downToUp);
                          },
                          child: const Text('Login'))),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Animate(
            effects: const [FadeEffect(),SlideEffect(begin: Offset(0, 0.4),curve: Curves.bounceInOut)],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 327,
                  height: 48,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              const RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.blueGrey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))))),
                      onPressed: () {
                        Get.to(Regis(isar: isar,),transition: Transition.downToUp);
                      },
                      child: const Text('Create Account')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
