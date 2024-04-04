import 'package:apartmy/starter_point.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
          apiKey: "AIzaSyDPN-2u1Aov-eRRkMM409bHfJN1fP0Xskw",
          appId: "1:1:1015665773186:android:00df489d2701142232829b",
          messagingSenderId: "1015665773186",
          projectId: "apartmy-1782c",
        ))
      : await Firebase.initializeApp();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]).then(
    (_) {
      runApp(
        const Apartmy(),
      );
    },
  );
}
