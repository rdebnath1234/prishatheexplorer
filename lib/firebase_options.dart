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
    apiKey: 'AIzaSyD74EabpNVjevg_CQlKSrC2nnsKvSGg8m4',
    appId: '1:1045897444226:web:c0cea7523a0c618e422d9b',
    messagingSenderId: '1045897444226',
    projectId: 'prisha-5ee69',
    authDomain: 'prisha-5ee69.firebaseapp.com',
    databaseURL: 'https://prisha-5ee69-default-rtdb.firebaseio.com',
    storageBucket: 'prisha-5ee69.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD5U7TToaTv8hmsf3edNDC-mOHEL8c-36M',
    appId: '1:1045897444226:android:f1a809ba83f076cc422d9b',
    messagingSenderId: '1045897444226',
    projectId: 'prisha-5ee69',
    databaseURL: 'https://prisha-5ee69-default-rtdb.firebaseio.com',
    storageBucket: 'prisha-5ee69.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBjkeoHIlqNg7pBYz0kDH7wcgNwHDnzH0A',
    appId: '1:1045897444226:ios:9d75edff405dd0bb422d9b',
    messagingSenderId: '1045897444226',
    projectId: 'prisha-5ee69',
    databaseURL: 'https://prisha-5ee69-default-rtdb.firebaseio.com',
    storageBucket: 'prisha-5ee69.appspot.com',
    iosBundleId: 'com.example.prishatheexplorer',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBjkeoHIlqNg7pBYz0kDH7wcgNwHDnzH0A',
    appId: '1:1045897444226:ios:3ecce63ba28929c9422d9b',
    messagingSenderId: '1045897444226',
    projectId: 'prisha-5ee69',
    databaseURL: 'https://prisha-5ee69-default-rtdb.firebaseio.com',
    storageBucket: 'prisha-5ee69.appspot.com',
    iosBundleId: 'com.example.prishatheexplorer.RunnerTests',
  );
}
