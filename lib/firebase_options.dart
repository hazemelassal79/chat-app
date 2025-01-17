// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyAwa9FI1g7D5dZhzIpqAp5ukspDs-ybNCQ',
    appId: '1:709195318561:web:e8e13a6ae4c0822b23aa60',
    messagingSenderId: '709195318561',
    projectId: 'chat-app-dae72',
    authDomain: 'chat-app-dae72.firebaseapp.com',
    storageBucket: 'chat-app-dae72.appspot.com',
    measurementId: 'G-M4R1N80GF5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBiuknB6mXr8S8c6u8gLVrSBYih_t3FI50',
    appId: '1:709195318561:android:80f4ef8b7583321523aa60',
    messagingSenderId: '709195318561',
    projectId: 'chat-app-dae72',
    storageBucket: 'chat-app-dae72.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB6iQNeCOv-FESVQoy0k7RLTtDjijva2D0',
    appId: '1:709195318561:ios:60ae6bb15911526023aa60',
    messagingSenderId: '709195318561',
    projectId: 'chat-app-dae72',
    storageBucket: 'chat-app-dae72.appspot.com',
    iosBundleId: 'com.example.chat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB6iQNeCOv-FESVQoy0k7RLTtDjijva2D0',
    appId: '1:709195318561:ios:60ae6bb15911526023aa60',
    messagingSenderId: '709195318561',
    projectId: 'chat-app-dae72',
    storageBucket: 'chat-app-dae72.appspot.com',
    iosBundleId: 'com.example.chat',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAwa9FI1g7D5dZhzIpqAp5ukspDs-ybNCQ',
    appId: '1:709195318561:web:e7540a547bf6fc8d23aa60',
    messagingSenderId: '709195318561',
    projectId: 'chat-app-dae72',
    authDomain: 'chat-app-dae72.firebaseapp.com',
    storageBucket: 'chat-app-dae72.appspot.com',
    measurementId: 'G-787P25TP2W',
  );
}
