import 'package:flutter/material.dart';

class Detail3 extends StatelessWidget {
  const Detail3({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView.builder(itemBuilder: (context, index) {
        return ListTile(
          title: const Text('Lorem Ipsum'),
          subtitle: Text('$index'),
        );
      }),
    );
  }
}
