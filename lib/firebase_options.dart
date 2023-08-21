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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for android - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDX4B77Ncs9-PphRu403cbJgCV7-j41zJ0',
    appId: '1:462552327688:web:ce50be3f8e7a3edc4953bd',
    messagingSenderId: '462552327688',
    projectId: 'personalinformation-ca167',
    authDomain: 'personalinformation-ca167.firebaseapp.com',
    storageBucket: 'personalinformation-ca167.appspot.com',
    measurementId: 'G-BRRCQ4RJPB',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBH_RPrnrNuuVclYa36j0_eUtU1LIGip0c',
    appId: '1:462552327688:ios:847e41df40aca4964953bd',
    messagingSenderId: '462552327688',
    projectId: 'personalinformation-ca167',
    storageBucket: 'personalinformation-ca167.appspot.com',
    iosClientId: '462552327688-rsldd8a8ec99rip0lncj70be10l8ueq8.apps.googleusercontent.com',
    iosBundleId: 'com.example.sampleApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBH_RPrnrNuuVclYa36j0_eUtU1LIGip0c',
    appId: '1:462552327688:ios:4dd73f3f067e4b914953bd',
    messagingSenderId: '462552327688',
    projectId: 'personalinformation-ca167',
    storageBucket: 'personalinformation-ca167.appspot.com',
    iosClientId: '462552327688-h104tuj9gdgt6sb70b88vgkivuqnarm9.apps.googleusercontent.com',
    iosBundleId: 'com.example.sampleApp.RunnerTests',
  );
}