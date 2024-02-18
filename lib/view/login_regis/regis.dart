// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isar/isar.dart';
import 'package:todo_app/controller/controller.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:todo_app/controller/notifications/notif.dart';
import 'package:todo_app/cubit/auth_cubit.dart';
import 'package:todo_app/view/main_page/home.dart';
import 'package:todo_app/widget/button.dart';
import 'package:todo_app/widget/buttonsmall.dart';

class Regis extends StatefulWidget {
  final Isar isar;

  const Regis({super.key, required this.isar,});

  @override
  State<Regis> createState() => _RegisState();
}

enum Buttonstate { init, loaded, succes }

class _RegisState extends State<Regis> {
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
    final isDOne = state == Buttonstate.succes;
    final isScretch = state == Buttonstate.init;
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            )),
                      ),
                    )),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: isScretch ? buttonInit(context) : buttonSmall(isDOne)),
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

  SizedBox buttonInit(BuildContext context) {
    return SizedBox(
      width: 327,
      height: 48,
      child: ElevatedButton(
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
              shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))))),
          onPressed: () async {
            if (passKey.currentState!.validate() ==
                confirmKey.currentState!.validate()) {
              setState(() => state = Buttonstate.loaded);
              await Future.delayed(const Duration(seconds: 2));
              setState(() => state = Buttonstate.succes);
              await Future.delayed(const Duration(seconds: 2));
              setState(() => state = Buttonstate.init);
            } else {
              return;
            }

            // ignore: use_build_context_synchronously
            context.read<AuthCubit>().singUp(email.text, password.text);

            Future.delayed(const Duration(seconds: 1), () {
              AwesomeNotifications().createNotification(
                content: NotificationContent(
                    id: 1,
                    channelKey: 'UserNew',
                    title: email.text.isEmpty
                        ? 'Helo User'
                        : 'Hello ${email.text}',
                    body: 'Let\'s Make your daily more productive!!!'),
              );

              Get.offAll(HomeScreen(isar: widget.isar,) );
            });
          },
          child: const Text('Register')),
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
