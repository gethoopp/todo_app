// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Detail1 extends StatelessWidget {
  const Detail1({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        drawer: const Drawer(),
        body: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: GestureDetector(
                      onTap: () {
                        print('ditekan');
                        //Scaffold.hasDrawer(context);
                      },
                      child:
                          const ImageIcon(AssetImage('Assets/icon/sort.png'))),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.15),
                  child: Text(
                    'Index',
                    style: GoogleFonts.lato(
                        fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.25),
                  child: const CircleAvatar(),
                )
              ],
            ),
            Center(
              heightFactor: size.height * 0.002,
              child: Column(
                children: [
                  Image.asset('Assets/image/Checklist.png'),
                  Text.rich(
                    TextSpan(
                        text: 'What Do You Want Today?',
                        style: GoogleFonts.lato(
                            fontSize: 20, fontWeight: FontWeight.w400),
                        children: [
                          TextSpan(
                              text: '\nTap + to add your task',
                              style: GoogleFonts.lato(
                                  color: Colors.white24,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400))
                        ]),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
