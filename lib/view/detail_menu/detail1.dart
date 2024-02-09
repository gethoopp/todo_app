// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/widget/empty.dart';


class Detail1 extends StatelessWidget {
  const Detail1({super.key});

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
        drawer: const Drawer(),
        body:  datafirstisempty(size) );
  }

  
}


