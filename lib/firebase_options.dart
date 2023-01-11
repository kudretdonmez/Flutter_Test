import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;

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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC0tHcB3ZeJdbWadNzKd465ZM2qW3OS2Vs',
    appId: '1:635507727888:android:09907cc99f60d3be7bb495',
    messagingSenderId: '635507727888',
    projectId: 'weatherstationiot-ea2ee',
    databaseURL: 'https://weatherstationiot-ea2ee-default-rtdb.firebaseio.com/',
    storageBucket: 'weatherstationiot-ea2ee.appspot.com',
  );
}
