import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:intern/Posts/add_posts.dart';
import 'package:intern/auth/login.dart';
import 'package:intern/utils/utils.dart';

class PostScreen extends StatefulWidget {
  static const String id = 'PostScreen';
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  final ref = FirebaseDatabase.instance.ref('Post');
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {

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
          // forceMaterialTransparency: true,
          title: const Text('Post Screen'),
          actions: [
            IconButton(onPressed: (){
              auth.signOut().then((value){
                Navigator.pushReplacementNamed(context, Login.id);
              }).onError((error, stackTrace){
                Utils().toastMessage(error.toString());
              });
            }, icon: const Icon(Icons.logout_rounded)),
            const SizedBox(width: 10,)
          ],
        ),
        body: Column(
          children:[
            Expanded(child: StreamBuilder(
              stream: ref.onValue,
              builder: (context, AsyncSnapshot<DatabaseEvent> snapshot){
                if(!snapshot.hasData){
                  return CircularProgressIndicator();
                }
                else{
                  return ListView.builder(
                      itemCount: snapshot.data!.snapshot.children.length,
                      itemBuilder: (context, index){
                        return ListTile(
                          title:Text("Listtile"),
                        );
                      });
                }

              },
            )),
            Expanded(child: FirebaseAnimatedList(
              query: ref,
              defaultChild: Text("Loading..."),
              itemBuilder:(context,snapshot,animation,index){
                return ListTile(
                  title: Text(snapshot.child('title').value.toString()),
                  subtitle: Text(snapshot.child('id').value.toString()),
                );
              }
            ),),
          ]
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.pushNamed(context, AddPostScreen.id);
        },
        child: const Icon(Icons.add),),

      ),
    );
  }
}


