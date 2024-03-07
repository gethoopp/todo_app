// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:day_night_time_picker/lib/state/time.dart';

PageController pagecontroll = PageController();
int selectedIndex = 0;
final auth = FirebaseAuth.instance;
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController confitmkey = TextEditingController();
TextEditingController confitmPassword = TextEditingController();
TextEditingController task = TextEditingController();
TextEditingController descript = TextEditingController();
final passKey = GlobalKey<FormState>();
final confirmKey = GlobalKey<FormState>();

Time time = Time(hour: 00, minute: 00, second: 00);

void onchanged(Time timechanged) {
  time = timechanged;
}

void onchangedDate(DateTime timer){
  time =  Time(hour: timer.hour,minute: timer.minute );
}