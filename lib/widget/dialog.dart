import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Future<dynamic> dialog() {
  return Get.dialog(Dialog(
    backgroundColor: Colors.grey[700],
    child: SizedBox(
      width: 100,
      height: 200,
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
             
             Row(
              children: [],
             )

        ],
      ),
    ),
  ));
}
