import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intern/auth/login.dart';
import 'package:intern/utils/utils.dart';

class PostScreen extends StatefulWidget {
  static const String id = 'PostScreen';
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // forceMaterialTransparency: true,
        title: Text('Post Screen'),
        actions: [
          IconButton(onPressed: (){
            auth.signOut().then((value){
              Navigator.pushReplacementNamed(context, Login.id);
            }).onError((error, stackTrace){
              Utils().toastMessage(error.toString());
            });
          }, icon: Icon(Icons.logout_rounded)),
          SizedBox(width: 10,)
        ],
      ),
    );
  }
}
