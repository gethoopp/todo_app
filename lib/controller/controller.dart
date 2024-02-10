
// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

      