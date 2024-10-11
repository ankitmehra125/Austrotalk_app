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
    apiKey: 'AIzaSyDG88urcU42vr_s1ggNgO1mnL1ew3pPF74',
    appId: '1:287843617963:web:24e1f508a7397e83e73bee',
    messagingSenderId: '287843617963',
    projectId: 'astrotalk-5f339',
    authDomain: 'astrotalk-5f339.firebaseapp.com',
    storageBucket: 'astrotalk-5f339.appspot.com',
    measurementId: 'G-65W9DW10RB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB02xWaX7i4LxanDVBAraMlHPHiSsWKkl8',
    appId: '1:287843617963:android:3d002f367a11e332e73bee',
    messagingSenderId: '287843617963',
    projectId: 'astrotalk-5f339',
    storageBucket: 'astrotalk-5f339.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCbPEXCbbffbiCMvlgmF4z1YM1ETlG61FM',
    appId: '1:287843617963:ios:a6940ca159367553e73bee',
    messagingSenderId: '287843617963',
    projectId: 'astrotalk-5f339',
    storageBucket: 'astrotalk-5f339.appspot.com',
    iosBundleId: 'com.example.austrotalk',
  );
}