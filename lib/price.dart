import 'package:flutter/material.dart';
class Price extends StatelessWidget {
  final String price;
  final Color color;
  final double size;
  const Price({super.key,required this.price,this.color = Colors.white,this.size = 18});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Text(price,style: TextStyle(fontWeight: FontWeight.bold,color: color,fontSize: size),),
          Text("night",style: TextStyle(color: color,fontSize: size-2),)
        ],
      );
  }
}
