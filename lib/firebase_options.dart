// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyBEamUfoIm2UX4z0X-TVsQPZbaUnvCSfvo',
    appId: '1:225552996674:web:47d5e997c8fce0d48090db',
    messagingSenderId: '225552996674',
    projectId: 'pmfilmes-195ac',
    authDomain: 'pmfilmes-195ac.firebaseapp.com',
    storageBucket: 'pmfilmes-195ac.appspot.com',
    measurementId: 'G-HGGGDSZ31D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCfFQkBKtQ6RgvIU4XaV2o3Fk1F22wqe14',
    appId: '1:225552996674:android:6b44eb6d88f441d18090db',
    messagingSenderId: '225552996674',
    projectId: 'pmfilmes-195ac',
    storageBucket: 'pmfilmes-195ac.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDqIGkAueVMYOHY4-aplxEzC8gjnwlT3ZM',
    appId: '1:225552996674:ios:f20df0a2152f2eea8090db',
    messagingSenderId: '225552996674',
    projectId: 'pmfilmes-195ac',
    storageBucket: 'pmfilmes-195ac.appspot.com',
    iosBundleId: 'com.example.pmfilmes',
  );
}
