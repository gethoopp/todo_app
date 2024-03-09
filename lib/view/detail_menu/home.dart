import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:isar/isar.dart';

import 'package:todo_app/localdata/category.dart';
import 'package:todo_app/localdata/data.dart';

import 'package:todo_app/widget/empty.dart';
import 'package:todo_app/widget/hasdata.dart';
import 'package:todo_app/widget/mydrawer.dart';

class Detail1 extends StatefulWidget {
  final Isar isar;

  const Detail1({
    super.key,
    required this.isar,
  });

  @override
  State<Detail1> createState() => _Detail1State();
}

class _Detail1State extends State<Detail1> {
  int _dropdownValue = 1;
  bool _showHeader = true;
  bool _hasData = false;
  bool ispresed = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: MyDrawer(
        isar: widget.isar,
      ),
      body: Column(
        children: [
          if (_showHeader && _hasData) ...[
            // Your header UI elements
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: Builder(builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child:
                          const ImageIcon(AssetImage('Assets/icon/sort.png')),
                    );
                  }),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.15),
                  child: Text(
                    'Index',
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.25),
                  child: const CircleAvatar(),
                ),
              ],
            ),
            SizedBox(
              width: 327,
              height: 48,
              child: TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(FontAwesomeIcons.searchengin),
                  hintText: 'Search By Your Task...',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40, top: 40),
                  child: SizedBox(
                    width: 106,
                    height: 31,
                    child: DropdownButton(
                      value: _dropdownValue,
                      items: const [
                        DropdownMenuItem(
                          value: 1,
                          child: Text('Today'),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text('Yesterday'),
                        ),
                        DropdownMenuItem(
                          value: 3,
                          child: Text('Weeks'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _dropdownValue = value as int;
                        });
                      },
                      icon: const Icon(Icons.arrow_drop_down),
                    ),
                  ),
                ),
              ],
            ),
          ],
          // Your data stream
          Expanded(
            child: StreamBuilder(
              stream: dataDat(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Data>> snapshots) {
                if (snapshots.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshots.connectionState ==
                    ConnectionState.active) {
                  if (snapshots.hasData && snapshots.data!.isNotEmpty) {
                    _hasData = true;
                    _showHeader = true;
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
                    _hasData = false;
                    _showHeader = false;
                    return datafirstisempty(size);
                  }
                } else if (snapshots.hasError) {
                  return Text("Error: ${snapshots.error}");
                } else {
                  _hasData = false;
                  _showHeader = false;
                  return datafirstisempty(
                      size); // fallback to empty data widget
                }
              },
            ),
          ),
        ],
      ),
    );
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
      await isar.datas.delete(1);
      await isar.categorys.delete(1);
    });
  }
}
