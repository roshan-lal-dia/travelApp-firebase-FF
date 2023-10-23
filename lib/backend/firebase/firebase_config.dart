import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "YourAPIKEy",
            authDomain: "travel-app-firebase-ff.firebaseapp.com",
            projectId: "travel-app-firebase-ff",
            storageBucket: "travel-app-firebase-ff.appspot.com",
            messagingSenderId: "679637715057",
            appId: "1:679637715057:web:8cc35dda8ac6f154ff73d0",
            measurementId: "G-5ND7JK361R"));
  } else {
    await Firebase.initializeApp();
  }
}
