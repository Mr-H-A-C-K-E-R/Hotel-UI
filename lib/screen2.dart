import 'package:flutter/material.dart';
import 'package:intern/contain.dart';
import 'package:intern/home_screen.dart';
import 'package:intern/price.dart';
import 'package:intern/star.dart';
import 'package:readmore/readmore.dart';

class Screen2 extends StatelessWidget {
  static const String id = "Screen2";
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              //maxHeight: MediaQuery.of(context).size.height,
              maxWidth: MediaQuery.of(context).size.width,
            ),
            child: Column(
              children: [
                Stack(
                  children: <Widget>[
                    Image.asset(
                      "lib/images/4.jpg",
                    ),
                    Positioned(
                      top: 20,
                      right: 80,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 15,
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(12),
                        ),
                        child: const Icon(
                          Icons.share_outlined,
                          size: 25,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      right: 15,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 15,
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(12),
                        ),
                        child: Image.asset(
                          "lib/images/heart.png",
                          scale: 2.45,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 15,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context,HomeScreen.id);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 15,
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(12),
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          size: 25,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 70,
                      left: 170,
                      child: Container(
                        child: const Center(
                            child: Text(
                          "124 photos",
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        )),
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color.fromARGB(92, 0, 0, 0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 230,
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                          color: Colors.white,
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 1.15,
                        // Example: semi-transparent black overlay
                        // Add any other child widgets or customization to the container
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30.0, right: 15),
                          child: Column(
                            children: [
                              const Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Text(
                                      "BaLi Motel",
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              const Row(
                                children: [
                                  Text(
                                    "Vung Tau",
                                    style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Row(
                                children: [
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Icon(
                                    Icons.pin_drop_outlined,
                                    color: Colors.black54,
                                    size: 22,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Indonesia",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 17),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Row(
                                children: [
                                  Star(rating: "4.9", color: Colors.black),
                                  SizedBox(width: 200),
                                  Price(
                                    price: "\$580/",
                                    color: Colors.black,
                                    size: 22,
                                  )
                                ],
                              ),
                              const Divider(
                                color: Colors.black26,
                                height: 50,
                                thickness: 1,
                                endIndent: 10,
                              ),
                              ReadMoreText(
                                "Set in Vung Tau, 100 meters from Front Beach, BaLi Motel Vung Tau offers accommodation with a garden, private parking and a shared swimming pool. ",
                                trimLines: 3,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: "Read more",
                                trimExpandedText: "Show less",
                                colorClickableText: Colors.amber.shade900,
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black54),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const Row(
                                children: [
                                  Text(
                                    "What we offer",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    children: [
                                      Contain(
                                        img: Icons.local_hotel_outlined,
                                        title: "2 Bed",
                                        iconColor: Colors.black54,
                                        height: 15,
                                        width: 15,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Contain(
                                        img: Icons.food_bank_outlined,
                                        title: "Dinner",
                                        iconColor: Colors.black54,
                                        height: 15,
                                        width: 15,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Contain(
                                        img: Icons.bathtub_outlined,
                                        title: "Hot Tub",
                                        iconColor: Colors.black54,
                                        height: 15,
                                        width: 15,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Contain(
                                        img: Icons.ac_unit_sharp,
                                        title: "1 Ac",
                                        iconColor: Colors.black54,
                                        height: 15,
                                        width: 15,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Row(
                                children: [
                                  Text(
                                    "Hosted by",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 0),
                                child: ListTile(
                                  title: const Text("Harleen Smith",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17)),
                                  titleAlignment:
                                      ListTileTitleAlignment.titleHeight,
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      "lib/images/img.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  subtitle: const Row(
                                    children: [
                                      Star(
                                          rating: "4.9 ",
                                          color: Colors.black),
                                      Text(
                                        "(1.4K review)",
                                        style: TextStyle(fontSize: 17),
                                      ),
                                    ],
                                  ),
                                  trailing: ElevatedButton(
                                    onPressed: () {},
                                    autofocus: true,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Colors.deepOrangeAccent.shade200,
                                      padding:
                                          const EdgeInsets.symmetric(vertical: 14),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18)),
                                      //side: BorderSide(width: 0.5,color: Colors.grey.shade500),
                                      elevation: 1,
                                    ),
                                    child: const Icon(
                                      Icons.message_outlined,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 130),
                                    decoration: BoxDecoration(
                                        color: Colors.blue.shade400,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Center(
                                      child: Text(
                                        "Book Now",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
