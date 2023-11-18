import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA3_7o3L-9ldfGCJrNJZeJ15XpswRsNnbg",
            authDomain: "dream-count-qsk3tx.firebaseapp.com",
            projectId: "dream-count-qsk3tx",
            storageBucket: "dream-count-qsk3tx.appspot.com",
            messagingSenderId: "803818332371",
            appId: "1:803818332371:web:672417ae3a722b7de53426"));
  } else {
    await Firebase.initializeApp();
  }
}
