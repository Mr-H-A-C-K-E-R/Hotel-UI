import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intern/Custom/contain.dart';
import 'package:intern/Custom/price.dart';
import 'package:intern/screen2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intern/Custom/star.dart';
import 'package:intern/utils/utils.dart';
import 'package:intern/auth/login.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'HomeScreen';
   HomeScreen({super.key});


  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemStatusBarContrastEnforced: false,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      "Where you",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontSize: 35),
                    ),
                    SizedBox(width: screenWidth/6),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 15,
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(12),
                      ),
                      child: const Icon(
                        Icons.search_outlined,
                        size: 30,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(width: screenWidth/30,),
                    ElevatedButton(
                      onLongPress: (){

                      },
                      onPressed: () {
                        auth.signOut().then((value){
                          Navigator.pushReplacementNamed(context, Login.id);
                        }).onError((error, stackTrace){
                          Utils().toastMessage(error.toString());
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 15,
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(12),
                      ),
                      child: const Icon(
                        Icons.logout_rounded,
                        size: 30,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      "wanna go?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontSize: 35),
                    ),
                  ],
                ),

                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Row(
                      children: [
                        Contain(
                          img: Icons.analytics_outlined,
                          title: "Hotels",
                          bg: Color(0xFF62a6f7),
                          iconColor: Colors.white,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Contain(img: Icons.local_airport_outlined, title: "Flight"),
                        SizedBox(
                          width: 20,
                        ),
                        Contain(
                          img: Icons.pin_drop_outlined,
                          title: "Place",
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Contain(
                          img: Icons.dining_outlined,
                          title: "Food",
                        ),
                      ],
                    ),
                  ),
                ),

                Row(
                  children: [
                    const Text(
                      "Popular Hotels",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: screenWidth/4,
                    ),
                    Text(
                      "See all",
                      textAlign: TextAlign.end,
                      style:
                          TextStyle(fontSize: 17, color: Colors.amber.shade800),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Stack(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Image.asset(
                              'lib/images/1.jpeg',
                              width: 170,
                              height: 240,
                              fit: BoxFit.fitHeight,
                              //scale: 1.34,
                            ),
                          ),
                          const Positioned(
                              left: 10,
                              bottom: 60,
                              child: Text("Santorini",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),)),
                          const Positioned(
                              left: 10,
                              bottom: 38,
                              child: Row(
                                children: [
                                  Icon(Icons.pin_drop_outlined,color: Colors.white70,size: 20,),
                                  SizedBox(width: 5,),
                                  Text("Greece",style: TextStyle(color: Colors.white70,fontSize: 15),),
                                ],
                              )),
                          const Positioned(
                            right:10,
                            bottom: 15,
                            child: Star(rating: "4.9"),),
                          const Positioned(
                              left: 10,
                              bottom: 15,
                              child: Price(price: "\$488/")),
                        ],
                      ),
                      SizedBox(width:20),
                      Stack(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Image.asset(
                              'lib/images/2.jpg',
                              width: 170,
                              height: 240,
                              fit: BoxFit.fitHeight,
                              //scale: 1.34,
                            ),
                          ),
                          const Positioned(
                              left: 10,
                              bottom: 60,
                              child: Text("Hotel Royal",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),)),
                          const Positioned(
                              left: 10,
                              bottom: 38,
                              child: Row(
                                children: [
                                  Icon(Icons.pin_drop_outlined,color: Colors.white70,size: 20,),
                                  SizedBox(width: 5,),
                                  Text("Spain",style: TextStyle(color: Colors.white70,fontSize: 15),),
                                ],
                              )),
                          const Positioned(
                            right:10,
                            bottom: 15,
                            child: Star(rating: "4.8"),),
                          const Positioned(
                              left: 10,
                              bottom: 15,
                              child: Price(price: "\$280/")),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Row(
                  children: [
                    Text(
                      "Hot Deals",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    padding: EdgeInsets.zero,
                    disabledBackgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: (){
                    Navigator.pushNamed(context, Screen2.id);
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width-31,
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: Image.asset(
                              'lib/images/4.jpg',
                              // width: 380,
                              // height: 240,
                              fit: BoxFit.fitHeight,
                                scale: 1.3,
                          ),
                            ),
                            Positioned(
                              top:10,
                              left:10,
                              child:Container(
                                width: 60,
                                height: 30,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.deepOrange.shade300,),
                                child: const Center(child: Text("25% OFF",style: TextStyle(color: Colors.white,fontSize: 13),)),
                              ),
                            ),
                            const Positioned(
                              left: 18,
                                bottom: 40,
                                child: Text("BaLi Motel Vung Tau",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),)),
                            const Positioned(
                                left: 20,
                                bottom: 14,
                                child: Row(
                              children: [
                                Icon(Icons.pin_drop_outlined,color: Colors.white,size: 20,),
                                SizedBox(width: 5,),
                                Text("Indonesia",style: TextStyle(color: Colors.white,fontSize: 15),),
                              ],
                            )),
                            const Positioned(
                                right:18,
                                bottom: 40,
                                child: Star(rating: "4.9"),),
                            const Positioned(
                                right: 18,
                                bottom: 17,
                                child: Price(price: "\$580/")),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
