import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/controller/controller.dart';

class Detail4 extends StatefulWidget {
  const Detail4({super.key});

  @override
  State<Detail4> createState() => _Detail4State();
}

class _Detail4State extends State<Detail4> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          
        ],
      ));
    
  }

  Future pickGallery(void Function() pickImage) async {
    var resultImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (resultImage == null) return;

    setState(() {
      resultImage = selectedImages;
    });
  }
}
