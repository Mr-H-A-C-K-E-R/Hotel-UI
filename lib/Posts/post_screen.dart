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
  final searchFilter = TextEditingController();
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
            SizedBox(height: screenHeight * 0.01,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: searchFilter,
                decoration: const InputDecoration(
                  hintText: "Search",
                  border: OutlineInputBorder(),
                ),
                onChanged: (String value){
                  setState(() {

                  });
                },
              ),
            ),

            Expanded(child: FirebaseAnimatedList(
              query: ref,
              defaultChild: const Text("Loading..."),
              itemBuilder:(context,snapshot,animation,index){
                // Filtering the data and searching.
                final title = snapshot.child('title').value.toString();
                if(searchFilter.text.isEmpty){
                return ListTile(
                  title: Text(snapshot.child('title').value.toString()),
                  subtitle: Text(snapshot.child('id').value.toString()),
                );
                }
                else if(title.toLowerCase().contains(searchFilter.text.toLowerCase().toString())){
                  return ListTile(
                    title: Text(snapshot.child('title').value.toString()),
                    subtitle: Text(snapshot.child('id').value.toString()),
                  );
                }
                else{
                  return const Text("");
                }
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
//Stream Builder way
// Expanded(child: StreamBuilder(
// stream: ref.onValue,
// builder: (context, AsyncSnapshot<DatabaseEvent> snapshot){
// if(!snapshot.hasData){
// return Center(child: CircularProgressIndicator());
// }
// else{
// Map<dynamic,dynamic> map = snapshot.data!.snapshot.value as dynamic;
// List<dynamic> ls =[];
// ls.clear();
// ls=map.values.toList();
// return ListView.builder(
// itemCount: snapshot.data!.snapshot.children.length,
// itemBuilder: (context, index){
// return ListTile(
// title: Text(ls[index]['title']),
// subtitle: Text(ls[index]['id']) ,
// );
// });
// }
//
// },
// )),
