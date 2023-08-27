import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intern/utils/utils.dart';

class AddPostScreen extends StatefulWidget {
  static const String id = 'AddPostScreen';
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {

  final postController = TextEditingController();
  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.ref('Post');
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
          title: const Text("Add Posts"),
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
                  databaseRef.child(id).set({
                    'title':postController.text.toString(),
                    'id':id,
                  }).then((value){
                    Utils().toastMessage("Post Added");
                    setState(() {
                      loading=false;
                    });
                  }).onError((error, stackTrace){
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
