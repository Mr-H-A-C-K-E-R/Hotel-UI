import 'package:flutter/material.dart';
class Star extends StatelessWidget {
  final String rating;
  final Color color;
  const Star({super.key,required this.rating,this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Row(
          children: [
            Icon(Icons.star,color: Colors.amber.shade800,),
            SizedBox(width: 4,),
            Text(rating,style: TextStyle(color: color,fontSize: 17),),
          ],
        );
  }
}
