
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:save_cost/presentation/components/theme_shared_preferences.dart';
class ThemeModel extends ChangeNotifier {


 late bool isDark =false;
 late  ThemeSharedPreferences themeSharedPreferences;
 bool get isDarkMode => isDark;
 ThemeMode (){
   isDark=false;
   themeSharedPreferences=ThemeSharedPreferences();
   getThemePreferences();
 }

 set isDarkMode (bool value)
 {
    isDark = value;
    themeSharedPreferences.setTheme(value);
    notifyListeners();
 }

 getThemePreferences()async{
   isDark=await themeSharedPreferences.getTheme();
   notifyListeners();
 }

}



class MyThemes
{
   static final darkTheme = ThemeData(
     primarySwatch: Colors.purple,
     scaffoldBackgroundColor: HexColor('333739'),
     appBarTheme: AppBarTheme(
       titleSpacing: 20.0,
       systemOverlayStyle:SystemUiOverlayStyle(
         statusBarColor: HexColor('333739'),
         statusBarBrightness:Brightness.light,
       ) ,
       backgroundColor:HexColor('333739'),
       elevation:0.0 ,
       titleTextStyle: TextStyle(
         color: Colors.white,
         fontSize: 20.0,
         fontWeight: FontWeight.bold,
       ),
       iconTheme: IconThemeData(
         color:Colors.white,

       ) ,
     ),
     floatingActionButtonTheme: FloatingActionButtonThemeData(
       backgroundColor: Colors.purple,
     ),
     bottomNavigationBarTheme: BottomNavigationBarThemeData(
       type: BottomNavigationBarType.fixed,
       selectedItemColor: Colors.purple,
       unselectedItemColor:Colors.grey ,
       elevation: 20.0,
       backgroundColor: HexColor('333739') ,
     ),
     textTheme: TextTheme(
       bodyText1: TextStyle(
         fontSize: 18.0,
         fontWeight: FontWeight.w600,
         color: Colors.white,
       ),
     ),
   );


   static final lightTheme = ThemeData(
     primarySwatch: Colors.purple,
     scaffoldBackgroundColor: Colors.white,
     appBarTheme:const AppBarTheme(
       titleSpacing: 20.0,
       systemOverlayStyle:SystemUiOverlayStyle(
         statusBarColor: Colors.grey,
         statusBarBrightness:Brightness.dark,
       ) ,
       backgroundColor: Colors.white,
       elevation:0.0 ,
       centerTitle: true,
       titleTextStyle: TextStyle(
         color: Colors.black,
         fontSize: 20.0,
         fontWeight: FontWeight.bold,
       ),
       iconTheme: IconThemeData(
         color:Colors.black,

       ) ,

     ),

     floatingActionButtonTheme:const FloatingActionButtonThemeData(
       backgroundColor: Colors.purple,
     ),
     bottomNavigationBarTheme:const BottomNavigationBarThemeData(
       type: BottomNavigationBarType.fixed,
       selectedItemColor: Colors.purple,
       unselectedItemColor:Colors.grey ,
       elevation: 20.0,
       backgroundColor: Colors.white ,
     ),
     textTheme: TextTheme(
       bodyText1: TextStyle(
         fontSize: 18.0,
         fontWeight: FontWeight.w600,
         color: Colors.black,
       ),
     ),
   );
}

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.purple,
  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    systemOverlayStyle:SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarBrightness:Brightness.light,
    ) ,
    backgroundColor: Colors.white,

    elevation:0.0 ,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color:Colors.white,

    ) ,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.purple,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.purple,
    unselectedItemColor:Colors.grey ,
    elevation: 20.0,
    backgroundColor: HexColor('333739') ,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
);

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.purple,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme:const AppBarTheme(
    titleSpacing: 20.0,
    systemOverlayStyle:SystemUiOverlayStyle(
      statusBarColor: Colors.grey,
      statusBarBrightness:Brightness.dark,
    ) ,
    backgroundColor: Colors.white,
    elevation:0.0 ,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color:Colors.black,

    ) ,

  ),

  floatingActionButtonTheme:const FloatingActionButtonThemeData(
    backgroundColor: Colors.purple,
  ),
  bottomNavigationBarTheme:const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.purple,
    unselectedItemColor:Colors.grey ,
    elevation: 20.0,
    backgroundColor: Colors.white ,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
);