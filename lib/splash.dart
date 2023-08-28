import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intern/auth/login.dart';
import 'package:intern/firestore/firestore_list_screen.dart';
import 'package:intern/splash_services.dart';
import 'package:intern/Posts/post_screen.dart';

class Splash extends StatefulWidget {
  static const String id = 'Splash';
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
void initState(){
    super.initState();
   SplashServices().isLogin(context);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 40.0,
            color:Color(0xff2D3142),
            fontFamily: 'Rubik Medium',
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              RotateAnimatedText('Hotels',duration: Duration(seconds: 1)),
              RotateAnimatedText('Flights',duration: Duration(seconds: 1)),
              RotateAnimatedText('Memories❤️',duration: Duration(seconds: 1)),
            ],
            repeatForever: false,
            isRepeatingAnimation: false,
            onFinished: (){
              if(SplashServices().isLogin(context)) {
                Navigator.popAndPushNamed(context, FireStoreScreen.id);
              }
              else{
                Navigator.popAndPushNamed(context, Login.id);
              }},
          ),
        ),
        ),
      );
  }
}
