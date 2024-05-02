import 'package:flutter/material.dart';
import 'package:islamy_app/my_theme.dart';
import 'package:provider/provider.dart';

import '../../providers/settings_provider.dart';

class TasbehTab extends StatefulWidget {
  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  double angle = 0.0;
  int currentIndex = 0;
  int counter = 0;
  List<String> azkar =[
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
  ];
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var provider= Provider.of<SettingsProvider>(context);
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
               Container(
                 height: mediaQuery.height * 0.34,
                 child: Stack(
                   children: [
                     Positioned(
                         child: Image.asset(
                           provider.isDarkMode()?'assets/images/head_sebha_dark.png':
                           'assets/images/head_sebha_logo.png',
                         height: mediaQuery.height * 0.1,),
                     left: mediaQuery.width * 0.46),
                     GestureDetector(
                       onTap:(){
                         setState(() {
                           OnClick();
                         });
                       },
                       child: Positioned(
                           child: Transform.rotate(
                             angle: angle,
                             child: Image.asset(
                               provider.isDarkMode()?'assets/images/body_sebha_dark.png':
                               'assets/images/body_sebha_logo.png',
                               height: mediaQuery.height * 0.28,),
                           ),
                             top:55 ,
                           left: mediaQuery.width * 0.2,),
                     ),
                   ],
                 ),
               ),
          Text('عدد التسبيحات',
              style:Theme.of(context).textTheme.headline6,),
          const SizedBox(height: 30,),
          Container(
            width: 70,
            height: 88,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(25),
          ),
            child: Text(
              counter.toString(), style: Theme.of(context).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.bold
            ),
            ),
          ),
          const SizedBox(height: 50,),
          Container(
            width:148,
              height :50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color:Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              azkar[currentIndex],
              style: Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.bold,
                    color : Colors.white
            ),
          ),),
          ],

      ),
    );
  }
  OnClick(){
    setState(() {
      counter++;
      angle--;
      if(counter==34){
        currentIndex++;
        counter=0;
      }
      if(currentIndex>azkar.length-1){
        currentIndex=0;
      }
    });

  }
}
