
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:isar/isar.dart';
import 'package:todo_app/localdata/category.dart';
import 'package:todo_app/localdata/data.dart';
import 'package:todo_app/widget/hasdata.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

class Detail2 extends StatefulWidget {
  final Isar isar;
  const Detail2({super.key, required this.isar});

  @override
  State<Detail2> createState() => _Detail2State();
}

class _Detail2State extends State<Detail2> {
  DateTime _selectedDay = DateTime.now();
  Matrix4 _matrix = Matrix4.rotationX(20);
  Color _colors = Colors.transparent;
  Color _colorsText1 = Colors.transparent;
  Color _colorsText2 = Colors.transparent;
  Color _colorsOutline = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Calendar',
                  style: GoogleFonts.lato(
                      fontSize: 20, fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: WeeklyDatePicker(
                    enableWeeknumberText: false,
                    selectedDigitBackgroundColor:
                        const Color.fromARGB(255, 20, 42, 59),
                    backgroundColor: Colors.grey,
                    selectedDay: _selectedDay,
                    changeDay: (val) => setState(() {
                          _selectedDay = val;
                          _matrix = Matrix4.rotationX(50);
                          _colors = Colors.grey;
                          _colorsText1 = Colors.white;
                          _colorsText2 = Colors.white;
                          _colorsOutline = Colors.blue;
                        })),
              )
            ],
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            transform: _matrix,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                height: 100,
                width: 250,
                color: _colors,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(_colorsOutline),
                            shape: MaterialStateProperty.all(
                                const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15))))),
                        onPressed: () => setState(() {
                           _matrix = Matrix4.rotationX(20);
                          _colors = Colors.transparent;
                          _colorsText1 = Colors.transparent;
                          _colorsText2 = Colors.transparent;
                          _colorsOutline = Colors.transparent;
                        }),
                        child: Text(
                          'Today',
                          style: TextStyle(color: _colorsText1),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Completed',
                          style: TextStyle(color: _colorsText2),
                        ))
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: StreamBuilder(
                stream: dataDat(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Data>> snapshots) {
                  if (snapshots.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshots.connectionState ==
                      ConnectionState.active) {
                    if (snapshots.hasData && snapshots.data!.isNotEmpty) {
                      return ListView.builder(
                        itemCount: snapshots.data!.length,
                        itemBuilder: (context, index) {
                          return StreamBuilder(
                            stream: dataDats(),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<Category>> snapshot) {
                              if (snapshot.hasData) {
                                return hasadata(
                                  size,
                                  snapshots.data![index],
                                  snapshot.data![index],
                                  widget.isar,
                                  deleteTask,
                                );
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                return const CircularProgressIndicator();
                              }
                            },
                          );
                        },
                      );
                    } else {
                      return const Center(child: Text("No tasks found!"));
                    }
                  } else if (snapshots.hasError) {
                    return Text("Error: ${snapshots.error}");
                  }

                  return Container();
                },
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Stream<List<Data>> dataDat() {
    return widget.isar.datas
        .where(sort: Sort.asc)
        .build()
        .watch(fireImmediately: true);
  }

  Stream<List<Category>> dataDats() {
    return widget.isar.categorys
        .where(sort: Sort.asc)
        .build()
        .watch(fireImmediately: true);
  }

  deleteTask(Isar isar) {
    isar.writeTxn(() async {
      await isar.datas.deleteAll([1]);
    });
  }
}
