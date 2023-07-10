import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intern/home_screen.dart';
import 'package:intern/screen2.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
    initialRoute: HomeScreen.id,
    routes: {
      HomeScreen.id : (context) => HomeScreen(),
      Screen2.id : (context) => Screen2(),
    },
    // home: HomeScreen(),
  );
  }
  }

