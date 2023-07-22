import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intern/home_screen.dart';
import 'package:intern/screen2.dart';
import 'package:intern/splash.dart';
import 'package:intern/login.dart';
import 'package:intern/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    title: "Intern App",
    initialRoute: Splash.id,
    routes: {
      Splash.id : (context) => Splash(),
      Login.id : (context) => Login(),
      SignUp.id : (context) => SignUp(),
      HomeScreen.id : (context) => HomeScreen(),
      Screen2.id : (context) => Screen2(),
    },
    // home: HomeScreen(),
  );
  }
  }

