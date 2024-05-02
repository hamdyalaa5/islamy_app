import 'package:flutter/material.dart';

class MyTheme {
  static const Color lightPrimareyColor = Color(0xFFB7935F);
  static const Color darkPrimareyColor = Color(0xFF141A2E);
  static const Color yellow = Color(0xFFFACC1D);
  static const Color white = Color(0xFFFFFFFF);
  static final ThemeData lightTheme = ThemeData(
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.white,
        shape :RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
          )
        )
    ),

     textTheme: TextTheme(
       headline6: TextStyle(
         fontSize:22,
           color: Colors.black,
       ),
       headline4: TextStyle(
         fontSize:28,
         color: Colors.black,
       ),
       subtitle2:TextStyle(
         fontSize: 14,
         color: Colors.black,
       )
     ),
      primaryColor: lightPrimareyColor,
      accentColor: lightPrimareyColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
          iconTheme: IconThemeData(color: Colors.black)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showUnselectedLabels: false,
          showSelectedLabels: true,
          selectedIconTheme: IconThemeData(size: 36, color: Colors.black),
          unselectedIconTheme: IconThemeData(size: 24, color: Colors.white),
          selectedLabelStyle: TextStyle(color: Colors.black),
          selectedItemColor: Colors.black));
  static final ThemeData darkTheme = ThemeData(
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: darkPrimareyColor,
          shape :RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              )
          )
      ),

      accentColor: yellow,
      textTheme: TextTheme(
        headline6: TextStyle(
          fontSize:22,
          color: Colors.white,
        ),
        headline4: TextStyle(
          fontSize:28,
          color: Colors.white,
        ),
          subtitle2:TextStyle(
            fontSize: 14,
            color: Colors.white,
          )
      ),
      primaryColor: darkPrimareyColor,

      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
          iconTheme: IconThemeData(color: Colors.white)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showUnselectedLabels: false,
          showSelectedLabels: true,
          selectedIconTheme: IconThemeData(size: 36, color: yellow),
          unselectedIconTheme: IconThemeData(size: 24, color: Colors.white),
          selectedLabelStyle: TextStyle(color: yellow),
          selectedItemColor: yellow));

}





