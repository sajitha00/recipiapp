import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Import the generated configuration file
import 'package:recipiapp/Screens/createAcc.dart';
import 'package:recipiapp/Screens/createNewPassword.dart';
import 'package:recipiapp/Screens/food.dart';
import 'package:recipiapp/Screens/forgotPassword.dart';
import 'package:recipiapp/Screens/home.dart';
import 'package:recipiapp/Screens/message.dart';
import 'package:recipiapp/Screens/profile.dart';
import 'package:recipiapp/Screens/recipiDetails.dart';
import 'package:recipiapp/Screens/register.dart';
import 'package:recipiapp/Screens/search.dart';
import 'package:recipiapp/Screens/settings.dart';
import 'package:recipiapp/Screens/splash.dart';
import 'package:recipiapp/Screens/verification.dart';
import 'package:recipiapp/Screens/welcome.dart';
import 'package:recipiapp/Screens/createPost.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FlutterSplashScreen(
      duration: Duration(milliseconds: 200),
      nextScreen: Profile(),
      splashScreenBody: SplashScreen(),
    ),
  ));
}
