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
    apiKey: 'AIzaSyD8LzwhNUVmCo9un_KKzTbNedsaZeKFAk4',
    appId: '1:835334941931:web:f98d135e7060179423e2ae',
    messagingSenderId: '835334941931',
    projectId: 'cbq-projeto',
    authDomain: 'cbq-projeto.firebaseapp.com',
    storageBucket: 'cbq-projeto.appspot.com',
    measurementId: 'G-MMYERK00RG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB_6-TruGTMLON5MILRL36j5d2C5oObtyE',
    appId: '1:835334941931:android:d3f05ba3ea075e4323e2ae',
    messagingSenderId: '835334941931',
    projectId: 'cbq-projeto',
    storageBucket: 'cbq-projeto.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDakc_3Wtvd4i2txKdT897OZreBNxyWh9A',
    appId: '1:835334941931:ios:c66758310a6e663523e2ae',
    messagingSenderId: '835334941931',
    projectId: 'cbq-projeto',
    storageBucket: 'cbq-projeto.appspot.com',
    androidClientId: '835334941931-673l55jfk4rbtf57vdoor1bencjefk14.apps.googleusercontent.com',
    iosClientId: '835334941931-rdt8349dc5lucrp9l5niojndis7d1f41.apps.googleusercontent.com',
    iosBundleId: 'com.example.projetoCbq',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDakc_3Wtvd4i2txKdT897OZreBNxyWh9A',
    appId: '1:835334941931:ios:c66758310a6e663523e2ae',
    messagingSenderId: '835334941931',
    projectId: 'cbq-projeto',
    storageBucket: 'cbq-projeto.appspot.com',
    androidClientId: '835334941931-673l55jfk4rbtf57vdoor1bencjefk14.apps.googleusercontent.com',
    iosClientId: '835334941931-rdt8349dc5lucrp9l5niojndis7d1f41.apps.googleusercontent.com',
    iosBundleId: 'com.example.projetoCbq',
  );
}
