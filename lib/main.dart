import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_app/screens/signup_screen.dart';
import 'package:instagram_clone_app/utils/colors.dart';

void main() {
  BindingBase.debugZoneErrorsAreFatal = true; // Set this at the beginning

  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      if (kIsWeb) {
        await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: 'AIzaSyAI4UFFcy_Y8nXczMptO2muCl8R8rLw4D4',
            appId: "1:732424620293:web:f00bbca2b349c3049ecf6c",
            messagingSenderId: "instagram-52dee",
            projectId: "1:732424620293:web:f00bbca2b349c3049ecf6c",
            storageBucket: "instagram-52dee.appspot.com",
          ),
        );
      } else {
        await Firebase.initializeApp();
      }

      runApp(const MyApp());
    },
    (error, stackTrace) {
      // Handle any errors that occur during initialization
      print('Error: $error');
      print('StackTrace: $stackTrace');
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // home: Scaffold(
      //   body: const ResponsiveLayout(
      //     mobileScreenLayout: MobileScreenLayout(),
      //     webScreenLayout: WebScreenLayout(),
      //   ),
      // ),
      home: SignUpScreen(),
    );
  }
}
