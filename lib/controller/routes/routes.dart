
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:todo_app/view/intro_page/intro_page1.dart';
import 'package:todo_app/view/intro_page/intro_page2.dart';
import 'package:todo_app/view/intro_page/intro_page3.dart';
import 'package:todo_app/view/login_regis/login.dart';
import 'package:todo_app/view/login_regis/regis.dart';
import 'package:todo_app/welcome_board.dart';

approute() => [
    GetPage(name: '/intro1', page: () => const Page1(),transition: Transition.downToUp),
    GetPage(name: '/intro2', page: () => const Page2(),transition: Transition.leftToRight),
    GetPage(name: '/intro3', page: () => const Page3(),transition: Transition.leftToRight),
    GetPage(name: '/WelcomeBoard', page: () => const  WelcomeBoard(),transition: Transition.fadeIn),
    GetPage(name: '/Login', page: () => const  Login(),transition: Transition.downToUp),
    GetPage(name: '/Regis', page: () => const  Regis(),transition: Transition.downToUp),

];