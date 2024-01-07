import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB5oiafTBaKgrYk-l1UNHAGqEtHsyqfxWw",
            authDomain: "mochmatch-3ed20.firebaseapp.com",
            projectId: "mochmatch-3ed20",
            storageBucket: "mochmatch-3ed20.appspot.com",
            messagingSenderId: "1033777845918",
            appId: "1:1033777845918:web:a2d95398922d84e4a0cd8f",
            measurementId: "G-TECLMSVXQF"));
  } else {
    await Firebase.initializeApp();
  }
}
