import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "REPLACE_API_KEY",
            authDomain: "dream-count-qsk3tx.firebaseapp.com",
            projectId: "dream-count-qsk3tx",
            storageBucket: "dream-count-qsk3tx.appspot.com",
            messagingSenderId: "803818332371",
            appId: "1:803818332371:web:0a103c774754d5c0e53426",
            measurementId: "G-0943S1SD4J"));
  } else {
    await Firebase.initializeApp();
  }
}
