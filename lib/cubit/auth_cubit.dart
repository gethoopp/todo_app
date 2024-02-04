// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/controller/controller.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void singUp(String email, String password) async {
    try {
      final result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      emit(AuthSucces(result.user));
    } on FirebaseAuthException catch (e) {
      emit(AuthErr());
      final snackbar = SnackBar(
        backgroundColor: Colors.transparent,
          behavior: SnackBarBehavior.floating,
          content: AwesomeSnackbarContent(
              title: 'Upss!!',
              message: e.message.toString(),
              contentType: ContentType.failure));

      ScaffoldMessenger.of(Get.context!)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackbar);
    }
  }

  void login(String email, String password) async {
    try {
      final result = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      emit(AuthSucces(result.user));
    } on FirebaseAuthException catch (e) {
      emit(AuthErr());
      final snackbar = SnackBar(
        backgroundColor: Colors.transparent,
          behavior: SnackBarBehavior.floating,
          content: AwesomeSnackbarContent(
              title: 'Upss!!',
              message: e.message.toString(),
              contentType: ContentType.failure));

      ScaffoldMessenger.of(Get.context!)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackbar);
    }
  }
}
