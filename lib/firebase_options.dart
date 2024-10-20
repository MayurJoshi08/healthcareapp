import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

/// Default [FirebaseOptions] for use with your Firebase Android app.
class DefaultFirebaseOptions {
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCEsNWkEHSEk0x0JSJMgZ5mY-J3HqN_x00',
    appId: '1:521995852178:android:62a575003a168d0a79c94b',
    messagingSenderId: '521995852178',
    projectId: 'cdafsd-ef247',
    storageBucket: 'cdafsd-ef247.appspot.com',
  );

  static FirebaseOptions get currentPlatform {
    return android; // Return Android configuration directly
  }
}
