import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isar/isar.dart';
import 'package:todo_app/controller/controller.dart';
import 'package:todo_app/localdata/data.dart';

Future<dynamic> dialog(Isar isar) {
  return Get.dialog(Dialog(
    backgroundColor: Colors.grey[700],
    child: SizedBox(
      width: 100,
      height: 250,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Add Task',
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              )
            ],
          ),
          SizedBox(
            width: 325,
            height: 43,
            child: TextFormField(
              controller: task,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                  hintText: 'Add your task',
                  enabledBorder:
                      UnderlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white,
                          strokeAlign: 20,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
          SizedBox(
            width: 325,
            height: 43,
            child: TextFormField(
              controller: descript,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                  hintText: 'Add Your Description',
                  enabledBorder:
                      UnderlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white,
                          strokeAlign: 20,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const ImageIcon(
                  AssetImage('Assets/icon/timer.png'),
                ),
                const ImageIcon(
                  AssetImage('Assets/icon/flag.png'),
                ),
                const ImageIcon(AssetImage('Assets/icon/tag.png')),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: GestureDetector(
                    onTap: () {
                     
                    addTask(isar);
                     
                    },
                    child: const ImageIcon(
                      AssetImage('Assets/icon/send.png'),
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  ));
}

 addTask(Isar isar) async {
    final data = Data()
      ..description = descript.text
      ..task = task.text;

    isar.writeTxn(() async {
      await isar.datas.put(data);
    });

    Get.back();
  }