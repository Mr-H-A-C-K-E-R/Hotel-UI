import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:intern/Posts/add_posts.dart';
import 'package:intern/auth/login.dart';
import 'package:intern/firestore/add_firestore_data.dart';
import 'package:intern/utils/utils.dart';

class FireStoreScreen extends StatefulWidget {
  static const String id = 'FireStoreScreen';
  const FireStoreScreen({super.key});

  @override
  State<FireStoreScreen> createState() => _FireStoreScreenState();
}

class _FireStoreScreenState extends State<FireStoreScreen> {
  final auth = FirebaseAuth.instance;
  final editController = TextEditingController();
  final fireStore = FirebaseFirestore.instance.collection('users').snapshots();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemStatusBarContrastEnforced: false,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 10,
          centerTitle: true,
          scrolledUnderElevation: 10,
          // forceMaterialTransparency: true,
          title: const Text('FireStore'),
          actions: [
            IconButton(
                onPressed: () {
                  auth.signOut().then((value) {
                    Navigator.pushReplacementNamed(context, Login.id);
                  }).onError((error, stackTrace) {
                    Utils().toastMessage(error.toString());
                  });
                },
                icon: const Icon(Icons.logout_rounded)),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: Column(children: [
          SizedBox(
            height: screenHeight * 0.01,
          ),

          StreamBuilder(
              stream: fireStore,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator());
                }
                if(snapshot.hasError){
                  return Text("An Error Occured");
                }
                return Expanded(
            child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context,index){
              return ListTile(
                title: Text(snapshot.data!.docs[index]['title'].toString()),
                subtitle: Text(snapshot.data!.docs[index]['id'].toString()),
              );
            }),
          );}),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AddFireStoreDataScreen.id);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Future<void> showEditDialog(String title, String id) async {
    editController.text = title;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Update'),
            content: Container(
              child: TextField(
                controller: editController,
                decoration: InputDecoration(
                  hintText: 'Edit',
                ),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Update')),
            ],
          );
        });
  }
  }

