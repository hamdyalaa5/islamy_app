import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadioController extends StatelessWidget {
  const RadioController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity ,
      child: Column(
        children:[
          Text('إذاعة القران الكريم',
          style:TextStyle(
            fontSize:26 ,
            fontWeight:FontWeight.bold,
          )
          ),
          const SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              IconButton(onPressed: (){}, icon: Icon(Icons.play_arrow, size: 45, color: Theme.of(context).primaryColor,)),
              IconButton(onPressed: (){}, icon: Icon(Icons.pause, size: 45, color: Theme.of(context).primaryColor,))
            ]

          )
        ]
      )
    );
  }
}
