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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBa_rEtH57eZ2afYq9QKidEpb3uM7gdHXE',
    appId: '1:368363648247:web:0ed2447038259e9cef0ff2',
    messagingSenderId: '368363648247',
    projectId: 'astrotalk-b453c',
    authDomain: 'astrotalk-b453c.firebaseapp.com',
    storageBucket: 'astrotalk-b453c.firebasestorage.app',
    measurementId: 'G-N5NQLCPPXH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAhIGoRMCQfK3PhId6-0-gcMrY8-_jccfU',
    appId: '1:368363648247:android:0692c3409ae96d7fef0ff2',
    messagingSenderId: '368363648247',
    projectId: 'astrotalk-b453c',
    storageBucket: 'astrotalk-b453c.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBp3H55NzwzoTarX3DWwPtYlEY4d1ix5xQ',
    appId: '1:368363648247:ios:3ead330586a0cf63ef0ff2',
    messagingSenderId: '368363648247',
    projectId: 'astrotalk-b453c',
    storageBucket: 'astrotalk-b453c.firebasestorage.app',
    iosBundleId: 'com.example.austrotalk',
  );
}
