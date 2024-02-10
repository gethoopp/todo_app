import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

Column hasadata(Size size, void Function(int? value)? callUpdate) {
  return Column(
    children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(50),
            child: GestureDetector(
                onTap: () {
                  print('ditekan');
                  //Scaffold.hasDrawer(context);
                },
                child: const ImageIcon(AssetImage('Assets/icon/sort.png'))),
          ),
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.15),
            child: Text(
              'Index',
              style:
                  GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.25),
            child: const CircleAvatar(),
          )
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
                  borderSide: BorderSide(color: Colors.white))),
        ),
      ),
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40,top: 40),
            child: SizedBox(
              width: 106,
              height: 31,
              child: DropdownButton(
                
                value: 1,
                items: const [
                  DropdownMenuItem(
                    value: 1 ,
                    child: Text('Today'),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Text('Yesterday'),
                  ),
            
                  DropdownMenuItem(
                    value: 3,
                    child: Text('Weeks'),
                  )
                ],
                onChanged: callUpdate ,
                icon: const Icon(Icons.arrow_drop_down)
              ),
            ),
          )
        ],
      )
    ],
  );
}
