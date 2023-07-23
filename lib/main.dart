import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intern/auth/login_with_phone_number.dart';
import 'package:intern/home_screen.dart';
import 'package:intern/screen2.dart';
import 'package:intern/splash.dart';
import 'package:intern/auth/login.dart';
import 'package:intern/auth/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intern/utils/post_screen.dart';

Future<void> main() async{
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
    theme: ThemeData(
      useMaterial3: false,
    ),
    themeMode: ThemeMode.light,
    title: "Intern App",
    initialRoute: Splash.id,
    routes: {
      Splash.id : (context) => Splash(),
      Login.id : (context) => Login(),
      LoginWithPhoneNumber.id: (context) => LoginWithPhoneNumber(),
      SignUp.id : (context) => SignUp(),
      HomeScreen.id : (context) => HomeScreen(),
      Screen2.id : (context) => Screen2(),
      PostScreen.id : (context) => PostScreen(),
    },

    // home: HomeScreen(),
  );
  }
  }

