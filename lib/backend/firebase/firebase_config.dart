import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAQduaHGf6FI5M89wEQmQ35K5Eo04A6WnU",
            authDomain: "eburon-bd040.firebaseapp.com",
            projectId: "eburon-bd040",
            storageBucket: "eburon-bd040.firebasestorage.app",
            messagingSenderId: "30841056766",
            appId: "1:30841056766:web:ec5096088ecd16b237e4af",
            measurementId: "G-GRN6HYJNC5"));
  } else {
    await Firebase.initializeApp();
  }
}
