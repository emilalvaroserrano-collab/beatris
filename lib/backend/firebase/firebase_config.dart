import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCm9fMcbhiPwy7xmZCjO8V83uaZNScES64",
            authDomain: "beatrice-os.firebaseapp.com",
            projectId: "beatrice-os",
            storageBucket: "beatrice-os.firebasestorage.app",
            messagingSenderId: "112636717363",
            appId: "1:112636717363:web:202bf0eb68ed80acb93646",
            measurementId: "G-Q82BHFCNZT"));
  } else {
    await Firebase.initializeApp();
  }
}
