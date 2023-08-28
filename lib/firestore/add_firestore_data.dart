import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intern/firestore/firestore_list_screen.dart';
import 'package:intern/utils/utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intern/firebase_options.dart';

class AddFireStoreDataScreen extends StatefulWidget {
  static const String id = 'AddFireStoreDataScreen';
  const AddFireStoreDataScreen({super.key});

  @override
  State<AddFireStoreDataScreen> createState() => _AddFireStoreDataScreenState();
}

class _AddFireStoreDataScreenState extends State<AddFireStoreDataScreen> {

  final postController = TextEditingController();
  bool loading = false;
  final fireStore = FirebaseFirestore.instance.collection('Aryan');

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemStatusBarContrastEnforced: false,
        systemNavigationBarIconBrightness: Brightness.dark,),
      child: Scaffold(
        appBar: AppBar(
          elevation:10,
          centerTitle: true,
          scrolledUnderElevation: 10,
          title: const Text("Add FireStoreData"),
        ),
        body: Column(
          children: [
            SizedBox(
              height: screenHeight*0.03,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                maxLines: 4,
                controller: postController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: "What's in your mind?",
                  fillColor: const Color(0xffF8F9FA),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xffE4E7EB),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xffE4E7EB),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight*0.03,
            ),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                color: const Color(0xFF62a6f7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    loading=true;
                  });
                  String id = DateTime.now().millisecondsSinceEpoch.toString();
                  fireStore.doc(id).set({
                    'title':postController.text.toString(),
                    'id':id,
                  }).then((value) {
                    setState(() {
                    loading=false;
                    });
                    Utils().toastMessage('FireStore Post Added');
                  }).onError((error, stackTrace) {
                    setState(() {
                      loading=false;
                    });
                    Utils().toastMessage(error.toString());
                  });
                },
                child: Center(
                  child: loading ? const CircularProgressIndicator(
                    strokeWidth: 3, color: Colors.white,) :const Text(
                    'Add',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Rubik Regular',
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
