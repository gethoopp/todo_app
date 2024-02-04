// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/controller/controller.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:todo_app/controller/notifications/notif.dart';
import 'package:todo_app/cubit/auth_cubit.dart';
import 'package:todo_app/widget/button.dart';

class Regis extends StatefulWidget {
  const Regis({super.key});

  @override
  State<Regis> createState() => _RegisState();
}

enum Buttonstate { init, loaded, succes }

class _RegisState extends State<Regis> {
  bool isScretch = true;
  @override
  void initState() {
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotifCall.onActionReceivedMethod,
        onNotificationCreatedMethod: NotifCall.onNotificationCreatedMethod,
        onNotificationDisplayedMethod: NotifCall.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod: NotifCall.onDismissActionReceivedMethod);
    super.initState();
  }

  Buttonstate state = Buttonstate.init;
  @override
  Widget build(BuildContext context) {
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
                  'Register',
                  style: GoogleFonts.lato(
                      fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.02),
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
                padding: EdgeInsets.only(top: size.height * 0.05),
                child: SizedBox(
                    width: 327,
                    height: 48,
                    child: Form(
                      key: passKey,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                        ),
                      ),
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.05),
                child: SizedBox(
                    width: 327,
                    height: 48,
                    child: Form(
                      key: confirmKey,
                      child: TextFormField(
                        controller: confitmPassword,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: (String? value) => valPass(value!),
                        decoration: const InputDecoration(
                            hintText: 'Confirm Password',
                            hintStyle: TextStyle(color: Colors.white38),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            )),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: SizedBox(
                    width: 327,
                    height: 48,
                    child: isScretch ? buttonInit(context) : buttonSmall()),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.05),
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
            text1: 'Register With Google',
            text2: 'Register With Apple',
            text3: 'Already have an account?',
            text4: ' Login',
          )
        ],
      ),
    );
  }

  ElevatedButton buttonInit(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))))),
        onPressed: () async {
          if (passKey.currentState!.validate() &&
              confirmKey.currentState!.validate()) {}

          context.read<AuthCubit>().singUp(email.text, password.text);

          Future.delayed(const Duration(seconds: 2), () {
            AwesomeNotifications().createNotification(
              content: NotificationContent(
                  id: 1,
                  channelKey: 'UserNew',
                  title:
                      email.text.isEmpty ? 'Helo User' : 'Hello ${email.text}',
                  body: 'Let\'s Make your daily more productive!!!'),
            );
          });
        },
        child: const Text('Register'));
  }

  ElevatedButton buttonSmall() {
    return ElevatedButton(
      onPressed: () {},
      child: Container(
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.blueGrey),
        child: const CircularProgressIndicator(),
      ),
    );
  }
}

String? valPass(String value) {
  if (password.text != confitmPassword.text) {
    return value = 'Password Tidak Sama';
  } else {
    return null;
  }
}
