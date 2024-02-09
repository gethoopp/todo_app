// ignore_for_file: depend_on_referenced_packages

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/controller/controller.dart';
import 'package:todo_app/controller/notifications/notif.dart';

import 'package:todo_app/cubit/auth_cubit.dart';

import 'package:todo_app/widget/button.dart';
import 'package:todo_app/widget/buttonsmall.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

enum ButtonState { init, loaded, succes }

class _LoginState extends State<Login> {
  @override
  void initState() {
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotifCall.onActionReceivedMethod,
        onNotificationCreatedMethod: NotifCall.onNotificationCreatedMethod,
        onNotificationDisplayedMethod: NotifCall.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod: NotifCall.onDismissActionReceivedMethod);
    super.initState();
  }

  ButtonState state = ButtonState.init;

  @override
  Widget build(BuildContext context) {
    final isStrect = state == ButtonState.init;
    final isDone = state == ButtonState.succes;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 30),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back))
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 30),
                child: Text(
                  'Login',
                  style: GoogleFonts.lato(
                      fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.10),
                child: SizedBox(
                    width: 327,
                    height: 48,
                    child: TextFormField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Enter Your Email',
                        hintStyle: TextStyle(color: Colors.white38),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.05,
                ),
                child: SizedBox(
                    width: 327,
                    height: 48,
                    child: TextFormField(
                      controller: password,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.white38),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: isStrect ? buttonInit(context) : buttonSmall(isDone),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.1),
            child: const Row(children: <Widget>[
              Expanded(
                  child: Divider(
                thickness: 2,
              )),
              Text("OR"),
              Expanded(
                  child: Divider(
                thickness: 2,
              )),
            ]),
          ),
          Button(
            text1: 'Login With Google',
            text2: 'Login With Apple',
            text3: 'Don\'t have an account?',
            text4: 'Register',
          )
        ],
      ),
    );
  }

  SizedBox buttonInit(BuildContext context) {
    return SizedBox(
        width: 327,
        height: 48,
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))))),
            onPressed: () async {
              context.read<AuthCubit>().login(email.text, password.text);
              Get.offAllNamed('/Home');
            },
            child: const Text('Login')));
  }
}
