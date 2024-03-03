import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isar/isar.dart';
import 'package:todo_app/localdata/category.dart';

Future<dynamic> category(Isar isar) {
  return Get.dialog(Dialog(
    backgroundColor: Colors.grey[900],
    child: SizedBox(
      width: 540,
      height: 506,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Choose Category',
                style:
                    GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.bold),
              )
            ],
          ),
          const Divider(
            thickness: 1,
            color: Colors.white,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: CustomScrollView(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                slivers: <Widget>[
                  SliverGrid(
                      delegate: SliverChildListDelegate([
                        GestureDetector(
                          onTap: () => addTask(isar, 'Assets/icon/bread 1.png'),
                          child: Container(
                            width: 64,
                            height: 75,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image:
                                        AssetImage('Assets/icon/bread 1.png')),
                                color: Colors.green[300],
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              addTask(isar, 'Assets/icon/briefcase 1.png'),
                          child: Container(
                            width: 64,
                            height: 90,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage(
                                        'Assets/icon/briefcase 1.png')),
                                color: Colors.red[300],
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              addTask(isar, 'Assets/icon/design (1) 1.png'),
                          child: Container(
                            width: 64,
                            height: 90,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage(
                                        'Assets/icon/design (1) 1.png')),
                                color: Colors.blue[300],
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              addTask(isar, 'Assets/icon/megaphone 1.png'),
                          child: Container(
                            width: 64,
                            height: 90,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage(
                                        'Assets/icon/megaphone 1.png')),
                                color: Colors.amber[300],
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                          ),
                        ),
                        Container(
                          width: 64,
                          height: 90,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage(
                                      'Assets/icon/mortarboard 1.png')),
                              color: Colors.green[300],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                        ),
                        Container(
                          width: 64,
                          height: 90,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage(
                                      'Assets/icon/music (1) 1.png')),
                              color: Colors.pink[300],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                        ),
                        Container(
                          width: 64,
                          height: 90,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage('Assets/icon/Vector.png')),
                              color: Colors.amber[300],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                        ),
                        Container(
                          width: 64,
                          height: 90,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage('Assets/icon/sport 1.png')),
                              color: Colors.pink[300],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                        ),
                        Container(
                          width: 64,
                          height: 90,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage(
                                      'Assets/icon/video-camera 1.png')),
                              color: Colors.lightGreen[300],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                        ),
                      ]),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 50,
                              crossAxisSpacing: 50,
                              crossAxisCount: 3))
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  ));
}

addTask(Isar isar, String icons) async {
  final data = Category()..icons = icons;

  isar.writeTxn(() async {
    await isar.categorys.put(data);
  });

  Get.back();
}
