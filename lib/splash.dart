import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intern/home_screen.dart';
import 'package:intern/login.dart';

class Splash extends StatefulWidget {
  static const String id = 'Splash';
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
//   void initState(){
//     super.initState();
//     // _navigatetohome();
// }
//
//  _navigatetohome()async{
//     await Future.delayed(Duration(seconds: 5),() {});
//     Navigator.popAndPushNamed(context, HomeScreen.id);
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            // FlutterLogo(
            //   style:FlutterLogoStyle.markOnly,
            //   duration: Duration(seconds: 5),
            //   size: MediaQuery.of(context).size.shortestSide/3.5,
            //   curve: Curves.easeInOutBack,
            // ),
            Row(
              //mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // const SizedBox(width: 20.0, height: 100.0),
                // const Text(
                //   'Book',
                //   style: TextStyle(fontSize: 43.0),
                // ),
                // const SizedBox(width: 20.0, height: 100.0),
                DefaultTextStyle(
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
                    //totalRepeatCount: 2,
                    onFinished: (){
                      Navigator.popAndPushNamed(context, Login.id);
                    },
                    onTap: () {
                      //print("Tap Event");
                    },
                  ),
                ),
              ],
            )
          ],
    ),
        ),
      );
  }
}
