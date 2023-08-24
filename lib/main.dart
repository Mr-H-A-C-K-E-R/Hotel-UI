import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intern/Posts/add_posts.dart';
import 'package:intern/auth/login_with_phone_number.dart';
import 'package:intern/home_screen.dart';
import 'package:intern/screen2.dart';
import 'package:intern/splash.dart';
import 'package:intern/auth/login.dart';
import 'package:intern/auth/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intern/Posts/post_screen.dart';

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
      useMaterial3: true,
    ),
    themeMode: ThemeMode.light,
    title: "Intern App",
    initialRoute: Splash.id,
    routes: {
      Splash.id : (context) => const Splash(),
      Login.id : (context) => const Login(),
      LoginWithPhoneNumber.id: (context) => const LoginWithPhoneNumber(),
      SignUp.id : (context) => const SignUp(),
      HomeScreen.id : (context) => HomeScreen(),
      Screen2.id : (context) => const Screen2(),
      PostScreen.id : (context) => const PostScreen(),
      AddPostScreen.id : (context) =>const AddPostScreen(),
    },

    // home: HomeScreen(),
  );
  }
  }

