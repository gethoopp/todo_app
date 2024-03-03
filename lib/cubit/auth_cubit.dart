// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:get/get_navigation/get_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/controller/controller.dart';
import 'package:todo_app/welcome_board.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void singUp(String email, String password) async {
    try {
      final result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      emit(AuthSucces(result.user));
    } on FirebaseAuthException catch (e) {
      final sncakBar = GetSnackBar(
        snackPosition: SnackPosition.BOTTOM,
        title: e.code,
        messageText: Text(e.message.toString()),
        backgroundColor: Colors.red,
      );

      emit(AuthErr(sncakBar));
    }
  }

  void login(String email, String password) async {
    try {
      final result = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      emit(AuthSucces(result.user));
    } on FirebaseAuthException catch (e) {
      final sncakBar = GetSnackBar(
        snackPosition: SnackPosition.BOTTOM,
        title: e.code,
        messageText: Text(e.message.toString()),
        backgroundColor: Colors.red,
      );

      emit(AuthErr(sncakBar));
    }
  }

  void logout() async {
    try {
      await auth.signOut();
      emit(AuthSucces(auth.currentUser));

      print('berhasil sign out');
    } on FirebaseAuthException catch (e) {
      final sncakBar = GetSnackBar(
        snackPosition: SnackPosition.BOTTOM,
        title: e.code,
        messageText: Text(e.message.toString()),
        backgroundColor: Colors.red,
      );

      emit(AuthErr(sncakBar));
    }
  }
}
