// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members, depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBtUBovE2O-mr6CVobuwvSGZcgop2uo3CQ',
    appId: '1:61707159879:web:0f53b5ee41f364fa9b2462',
    messagingSenderId: '61707159879',
    projectId: 'todoapp-69b3c',
    authDomain: 'todoapp-69b3c.firebaseapp.com',
    storageBucket: 'todoapp-69b3c.appspot.com',
    measurementId: 'G-652WXDZKEY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAv0x5PqvogRqpzNk8zV9LdqppNRPN7gXw',
    appId: '1:61707159879:android:473b367d25c705f89b2462',
    messagingSenderId: '61707159879',
    projectId: 'todoapp-69b3c',
    storageBucket: 'todoapp-69b3c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAxQJbVBgmSqkZ4rZYls47Pn6wQ4HPRnCE',
    appId: '1:61707159879:ios:e92a9830711db8299b2462',
    messagingSenderId: '61707159879',
    projectId: 'todoapp-69b3c',
    storageBucket: 'todoapp-69b3c.appspot.com',
    androidClientId: '61707159879-705m484due5tflj1lbngujb0cll0de6i.apps.googleusercontent.com',
    iosClientId: '61707159879-lptf3oiqhs53v7fsu7sfnqvvoa5rdqlh.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAxQJbVBgmSqkZ4rZYls47Pn6wQ4HPRnCE',
    appId: '1:61707159879:ios:ad2ff32cbf0bac179b2462',
    messagingSenderId: '61707159879',
    projectId: 'todoapp-69b3c',
    storageBucket: 'todoapp-69b3c.appspot.com',
    androidClientId: '61707159879-705m484due5tflj1lbngujb0cll0de6i.apps.googleusercontent.com',
    iosClientId: '61707159879-6av1vknve8r6jl0s640hbgngfvep2v0o.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoApp.RunnerTests',
  );
}
