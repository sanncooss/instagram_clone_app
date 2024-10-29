import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_app/firebase_options.dart';
import 'package:instagram_clone_app/screens/signup_screen.dart';
import 'package:instagram_clone_app/utils/colors.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  BindingBase.debugZoneErrorsAreFatal = true;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
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
