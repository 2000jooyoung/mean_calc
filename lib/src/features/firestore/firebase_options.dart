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
    apiKey: 'AIzaSyDdWiZlWu5HNgUwdvMhR_4VruKsiZe8PUc',
    appId: '1:522574138754:web:416c322778cb1ee102139b',
    messagingSenderId: '522574138754',
    projectId: 'epfl-938a8',
    authDomain: 'epfl-938a8.firebaseapp.com',
    storageBucket: 'epfl-938a8.appspot.com',
    measurementId: 'G-JQL5RGT1WV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBRSHJlogwy5hy6gm5ePRXDItGJH9phKrI',
    appId: '1:522574138754:android:9c3d0b0364f12b2402139b',
    messagingSenderId: '522574138754',
    projectId: 'epfl-938a8',
    storageBucket: 'epfl-938a8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZycdK3-ULJ4lIsY-zYM1psEnyyHFreJ0',
    appId: '1:522574138754:ios:cf469970f4fb1b7e02139b',
    messagingSenderId: '522574138754',
    projectId: 'epfl-938a8',
    storageBucket: 'epfl-938a8.appspot.com',
    iosClientId: '522574138754-qesajbo219q8u89l8oo1ksov61gpik35.apps.googleusercontent.com',
    iosBundleId: 'com.example.meanCalcTest',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCZycdK3-ULJ4lIsY-zYM1psEnyyHFreJ0',
    appId: '1:522574138754:ios:18d5f5d0d4b2ca0302139b',
    messagingSenderId: '522574138754',
    projectId: 'epfl-938a8',
    storageBucket: 'epfl-938a8.appspot.com',
    iosClientId: '522574138754-qordfs0focsnsqhu70al4ee2gqnf2u3u.apps.googleusercontent.com',
    iosBundleId: 'com.example.meanCalc.RunnerTests',
  );
}
