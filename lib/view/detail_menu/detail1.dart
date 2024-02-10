import 'package:flutter/material.dart';

import 'package:isar/isar.dart';
import 'package:todo_app/localdata/data.dart';

import 'package:todo_app/widget/empty.dart';
import 'package:todo_app/widget/hasdata.dart';

class Detail1 extends StatefulWidget {
  final Isar isar;
  const Detail1({super.key,required this.isar});

  @override
  State<Detail1> createState() => _Detail1State();
}


class _Detail1State extends State<Detail1> {
  @override
  
  Widget build(BuildContext context) {
   void updateval(int? value){
    setState(() {
      value = value;
    }); 
}   
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const Drawer(),
      
      body: widget.isar.datas.count() == 0 ? datafirstisempty(size) : hasadata(size,updateval)
    );
  }
}
