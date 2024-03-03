// ignore: duplicate_ignore
// ignore_for_file: depend_on_referenced_packages

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:isar/isar.dart';

import 'package:todo_app/cubit/auth_cubit.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:todo_app/localdata/category.dart';
import 'package:todo_app/localdata/data.dart';

import 'package:path_provider/path_provider.dart';
import 'package:todo_app/splashscreen/splash_screen.dart';

import 'package:todo_app/view/main_page/home.dart';

//

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  final isar =
      await Isar.open([DataSchema, CategorySchema], directory: dir.path);

  await AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelKey: 'UserNew',
      channelName: 'New User',
      channelDescription: 'Notification for new user',
      defaultColor: const Color(0xFF9D50DD),
      ledColor: Colors.white,
      channelGroupKey: 'user_new_group',
      importance: NotificationImportance.High,
    )
  ], channelGroups: [
    NotificationChannelGroup(
      channelGroupKey: 'user_new_group',
      channelGroupName: 'User New',
    )
  ]);
  bool isPermit = await AwesomeNotifications().isNotificationAllowed();

  if (!isPermit) {
    AwesomeNotifications().requestPermissionToSendNotifications();
  }
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp(
    isar: isar,
  ));
}

class MyApp extends StatelessWidget {
  final Isar isar;

  const MyApp({
    super.key,
    required this.isar,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: BlocProvider(
        create: (context) => AuthCubit(),
        child: GetMaterialApp(
            title: 'Flutter app Todo',
            theme: ThemeData.dark(),
            home: Splash(
              isar: isar,
            )),
      ),
    );
  }
}
