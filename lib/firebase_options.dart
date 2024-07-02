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
    apiKey: 'AIzaSyAdC2JQsO_Opwddopv0Ly5nYyDrKGA5Xtc',
    appId: '1:121283608966:web:49b039de3ee8794c94ec07',
    messagingSenderId: '121283608966',
    projectId: 'tueny-mobile-apps',
    authDomain: 'tueny-mobile-apps.firebaseapp.com',
    storageBucket: 'tueny-mobile-apps.appspot.com',
    measurementId: 'G-2TFZLWWJFH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCAqQOazL-RvqUIx2dm7huPhr60yvrtL3M',
    appId: '1:121283608966:android:d98b18ab4be1a32a94ec07',
    messagingSenderId: '121283608966',
    projectId: 'tueny-mobile-apps',
    storageBucket: 'tueny-mobile-apps.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBOTwU-Zx_fowlX-M1X3X3s6t8JQz8h01E',
    appId: '1:121283608966:ios:315dcfe7ce35dbea94ec07',
    messagingSenderId: '121283608966',
    projectId: 'tueny-mobile-apps',
    storageBucket: 'tueny-mobile-apps.appspot.com',
    iosBundleId: 'com.example.assignment3',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBOTwU-Zx_fowlX-M1X3X3s6t8JQz8h01E',
    appId: '1:121283608966:ios:315dcfe7ce35dbea94ec07',
    messagingSenderId: '121283608966',
    projectId: 'tueny-mobile-apps',
    storageBucket: 'tueny-mobile-apps.appspot.com',
    iosBundleId: 'com.example.assignment3',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAdC2JQsO_Opwddopv0Ly5nYyDrKGA5Xtc',
    appId: '1:121283608966:web:3c3852c51418b0e794ec07',
    messagingSenderId: '121283608966',
    projectId: 'tueny-mobile-apps',
    authDomain: 'tueny-mobile-apps.firebaseapp.com',
    storageBucket: 'tueny-mobile-apps.appspot.com',
    measurementId: 'G-F4YRYP2LHZ',
  );
}