import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isar/isar.dart';
import 'package:todo_app/controller/controller.dart';
import 'package:todo_app/localdata/category.dart';

import 'package:todo_app/localdata/data.dart';

Column hasadata(Size size, Data data, Category cat,Isar isar,dynamic Function(Isar isar) deleteTask) {
  bool ispresed = false;
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
            color: Colors.grey[800], borderRadius: BorderRadius.circular(4)),
        height: 72,
        width: 327,
        child: Column(
          children: [
            ListTile(
              leading:
                  // ignore: prefer_const_constructors
                  IconButton(
                      onPressed: () =>deleteTask(isar), icon: const Icon(Icons.circle_outlined)),
              title: Text(
                '${data.task}',
                maxLines: 1,
                style: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  // ignore: dead_code
                  decoration: ispresed ? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
              subtitle: Text(
                'Today $time',
                textAlign: TextAlign.justify,
                maxLines: 1,
                style: GoogleFonts.lato(
                  fontSize: 15,
                  // ignore: dead_code
                  decoration: ispresed ? TextDecoration.lineThrough : TextDecoration.none,

                ),
              ),
              trailing: ImageIcon(
                AssetImage('${cat.icons}'),
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 15,
      )
    ],
  );
}

