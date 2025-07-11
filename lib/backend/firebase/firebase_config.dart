import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDd8qQXoi0FU1Bt7L8-vUYazSk-of0py9Y",
            authDomain: "proyectomoviles-g3.firebaseapp.com",
            projectId: "proyectomoviles-g3",
            storageBucket: "proyectomoviles-g3.firebasestorage.app",
            messagingSenderId: "439950448525",
            appId: "1:439950448525:web:8f4c94cac7c5b8db1bcfc4"));
  } else {
    await Firebase.initializeApp();
  }
}
