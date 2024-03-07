import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isar/isar.dart';
import 'package:todo_app/controller/controller.dart';
import 'package:todo_app/localdata/data.dart';
import 'package:todo_app/widget/category.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';

Future<dynamic> dialog(
    Isar isar, BuildContext context, void Function(Time) onChange, Time timer,void Function(DateTime)? onChangeDateTime) {
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
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      showPicker(
                        blurredBackground: true,
                        themeData: ThemeData.dark(),
                        barrierColor: Colors.transparent,
                        accentColor: Colors.blue,
                        context: context,
                        value: timer,
                        sunrise:
                            const TimeOfDay(hour: 6, minute: 0), // optional
                        sunset:
                            const TimeOfDay(hour: 18, minute: 0), // optional

                        onChange: onChange,
                        onChangeDateTime: (val){
                          
                        }
                      ),
                    );
                  },
                  child: const ImageIcon(
                    AssetImage('Assets/icon/timer.png'),
                  ),
                ),
                const ImageIcon(
                  AssetImage('Assets/icon/flag.png'),
                ),
                GestureDetector(
                    onTap: () => category(isar),
                    child: const ImageIcon(AssetImage('Assets/icon/tag.png'))),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: GestureDetector(
                    onTap: () => addTask(isar),
                      
                    
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
