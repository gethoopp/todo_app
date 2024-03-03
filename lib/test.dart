import 'package:flutter/material.dart';

import 'package:isar/isar.dart';
import 'package:todo_app/localdata/category.dart';
import 'package:todo_app/widget/empty.dart';


class MyWidget extends StatefulWidget {
  final Isar isar;
  const MyWidget({super.key,required this.isar});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
   final size = MediaQuery.of(context).size;
    return  Scaffold(
      body: Column(
        children: [
         Expanded(
            child: StreamBuilder(
              stream: dataDat(), 
              builder:
                  (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    
                   
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Center(
                          child: Image.asset('${snapshot.data}'),
                        );
                      },
                    );
                  } else {
                    
                    return datafirstisempty(size);
                  }
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else {
                  
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

   Stream<List<Category>> dataDat() {
    return widget.isar.categorys
        .where(sort: Sort.asc)
        .build()
        .watch(fireImmediately: true);
  }
}

