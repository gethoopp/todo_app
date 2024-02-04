// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  String text1;
  String text2;
  String text3;
  String text4;
  
   Button({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: SizedBox(
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
                  
                  },
                  child: Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.google,
                        color: Colors.red,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Text(
                          text1,
                          style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ))),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: SizedBox(
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
                    Get.toNamed('/Login');
                  },
                  child: Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.apple,
                        color: Colors.red,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 55),
                        child: Text(
                          text2,
                          style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ))),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Text.rich(
            TextSpan(
                text: text3,
                style: GoogleFonts.lato(
                    fontSize: 12, fontWeight: FontWeight.w400),
                children: [
                  TextSpan(
                      text: text4,
                      style: GoogleFonts.lato(
                          color: Colors.white, fontSize: 14))
                ]),
          ),
        ),
      ],
    );
  }
}
