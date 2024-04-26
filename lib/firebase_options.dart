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
    apiKey: 'AIzaSyBBdEvEbdSe7MqMC9Wn5Hi23KspYCS9tcY',
    appId: '1:257884960620:web:451a96e841309bed6ca549',
    messagingSenderId: '257884960620',
    projectId: 'appoinment-doctor-7ce3b',
    authDomain: 'appoinment-doctor-7ce3b.firebaseapp.com',
    storageBucket: 'appoinment-doctor-7ce3b.appspot.com',
    measurementId: 'G-KVTJYYJD51',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBQvZs5W2lxJ_bohMuRi5xjlw0ovfAH5Ug',
    appId: '1:257884960620:android:0594a13dd8c518616ca549',
    messagingSenderId: '257884960620',
    projectId: 'appoinment-doctor-7ce3b',
    storageBucket: 'appoinment-doctor-7ce3b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB0ce3qBrtnqc5KRjER2E11MWEKHlDc2oU',
    appId: '1:257884960620:ios:8af8f2302fd4289e6ca549',
    messagingSenderId: '257884960620',
    projectId: 'appoinment-doctor-7ce3b',
    storageBucket: 'appoinment-doctor-7ce3b.appspot.com',
    iosBundleId: 'com.example.appointmentDoctor',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB0ce3qBrtnqc5KRjER2E11MWEKHlDc2oU',
    appId: '1:257884960620:ios:8af8f2302fd4289e6ca549',
    messagingSenderId: '257884960620',
    projectId: 'appoinment-doctor-7ce3b',
    storageBucket: 'appoinment-doctor-7ce3b.appspot.com',
    iosBundleId: 'com.example.appointmentDoctor',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBBdEvEbdSe7MqMC9Wn5Hi23KspYCS9tcY',
    appId: '1:257884960620:web:6a3b3b09ec4dd5bd6ca549',
    messagingSenderId: '257884960620',
    projectId: 'appoinment-doctor-7ce3b',
    authDomain: 'appoinment-doctor-7ce3b.firebaseapp.com',
    storageBucket: 'appoinment-doctor-7ce3b.appspot.com',
    measurementId: 'G-SVEYPNX3TW',
  );
}
