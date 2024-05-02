
import 'package:flutter/material.dart';
import 'package:islamy_app/home/radio/radio_controller.dart';
import 'package:http/http.dart' as http;

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
     child:Column(
       children: [
         Expanded(
           flex:3,
             child:Image.asset('assets/images/radio_image.png'),
         ),
         Expanded(
           flex: 2,
           child: RadioController(),)
       ],
     )
    );
  }
}
