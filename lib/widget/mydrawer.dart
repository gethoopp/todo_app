import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isar/isar.dart';
import 'package:todo_app/cubit/auth_cubit.dart';

import '../welcome_board.dart';

class MyDrawer extends StatelessWidget {
  final Isar isar;
  const MyDrawer({super.key, required this.isar});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // ignore: prefer_const_constructors
    return Drawer(
        child: Center(
            child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(size.height * 0.1),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Profile',
                  style: GoogleFonts.lato(
                      fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('Assets/image/user.jpg'),
                  )
                ],
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 58,
              width: 120,
              color: Colors.grey,
              child: const Center(child: Text('10 Task Left')),
            ),
            Container(
              height: 58,
              width: 120,
              color: Colors.grey,
              child: const Center(
                child: Text('5 Task Done'),
              ),
            )
          ],
        )
      ],
    )));
  }
}
