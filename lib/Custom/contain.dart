import 'package:flutter/material.dart';
class Contain extends StatelessWidget {
  final IconData img;
  final String title;
  final Color iconColor;
  final Color bg;
  final double height;
  final double width;

  const Contain({Key? key, required this.img,
    this.iconColor = Colors.black54,
    required this.title,this.bg = Colors.white,
  this.height = 30,
  this.width = 20}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
      },
      autofocus: true,
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: Colors.white,
        backgroundColor: bg,
        padding: EdgeInsets.symmetric(horizontal: width,vertical: height),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        //side: BorderSide(width: 0.5,color: Colors.grey.shade500),
        elevation: 1,
      ),
      child: Center(
        child: Column(
          children: [
            Icon(img,color: iconColor,size: 30,),
            SizedBox(height: 10,),
            Text(title,style: TextStyle(color: iconColor,fontSize: 16),),
          ],
        ),
      ),

    );
  }
}
