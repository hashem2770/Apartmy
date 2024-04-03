import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:apartmy/features/home_view/views/home_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  ]).then((_) {
    runApp(
      const Apartmy(),
    );
  });


}

class Apartmy extends StatelessWidget {
  const Apartmy({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Apartmy',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeView(),
      ),
    );
  }
}
