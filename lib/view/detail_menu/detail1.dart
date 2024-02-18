import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isar/isar.dart';
import 'package:todo_app/localdata/data.dart';
import 'package:todo_app/widget/empty.dart';
import 'package:todo_app/widget/hasdata.dart';

class Detail1 extends StatefulWidget {
  final Isar isar;
  const Detail1({super.key, required this.isar});

  @override
  State<Detail1> createState() => _Detail1State();
}

class _Detail1State extends State<Detail1> {
  int _dropdownValue = 1;
  bool _showHeader = true;
  bool _hasData = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const Drawer(),
      body: Column(
        children: [
          if (_showHeader && _hasData) ...[
            // Your header UI elements
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: GestureDetector(
                    onTap: () {
                      print('ditekan');
                      //Scaffold.hasDrawer(context);
                    },
                    child: const ImageIcon(AssetImage('Assets/icon/sort.png')),
                  ),
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
                  (BuildContext context, AsyncSnapshot<List<Data>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    _hasData = true;
                     _showHeader = true;
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return hasadata(size, snapshot.data![index]);
                      },
                    );
                  } else {
                    _hasData = false;
                    _showHeader = false;
                    return datafirstisempty(size);
                  }
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
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
}
