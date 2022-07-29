// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDfirilrR1nmaiOvUBDbz4WDSpLeY_EDUA',
    appId: '1:267107880624:web:561893a04d667735b7f575',
    messagingSenderId: '267107880624',
    projectId: 'workshopproject-bfacb',
    authDomain: 'workshopproject-bfacb.firebaseapp.com',
    storageBucket: 'workshopproject-bfacb.appspot.com',
    measurementId: 'G-996MDKYT3M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA5vWFdrNRM5jRvcVgbFAzgI7SckEFAB4M',
    appId: '1:267107880624:android:64e12c1c140ec523b7f575',
    messagingSenderId: '267107880624',
    projectId: 'workshopproject-bfacb',
    storageBucket: 'workshopproject-bfacb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC8ivAFXPFTQL-sdn2LpzAz5FLqR4BG718',
    appId: '1:267107880624:ios:0688a2976ff4f407b7f575',
    messagingSenderId: '267107880624',
    projectId: 'workshopproject-bfacb',
    storageBucket: 'workshopproject-bfacb.appspot.com',
    iosClientId: '267107880624-o0ic0eeiibci04bq25fifben10liot11.apps.googleusercontent.com',
    iosBundleId: 'com.example.workShopApp',
  );
}
