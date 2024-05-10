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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAuzK97UCj6SflFwbqg1DsJjoODMXqvWSI',
    appId: '1:621263209325:web:8077d8163c3ae451769064',
    messagingSenderId: '621263209325',
    projectId: 'newfirebase-75701',
    authDomain: 'newfirebase-75701.firebaseapp.com',
    storageBucket: 'newfirebase-75701.appspot.com',
    measurementId: 'G-GC2WDE5GD6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBYDEHcHVX-pe_f3H7-GBrnJfezWZ8hRlY',
    appId: '1:621263209325:android:a7c132889b027c73769064',
    messagingSenderId: '621263209325',
    projectId: 'newfirebase-75701',
    storageBucket: 'newfirebase-75701.appspot.com',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAuzK97UCj6SflFwbqg1DsJjoODMXqvWSI',
    appId: '1:621263209325:web:8e0b2baae01f2f80769064',
    messagingSenderId: '621263209325',
    projectId: 'newfirebase-75701',
    authDomain: 'newfirebase-75701.firebaseapp.com',
    storageBucket: 'newfirebase-75701.appspot.com',
    measurementId: 'G-XG99FZ3YWC',
  );
}
