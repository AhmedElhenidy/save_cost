
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:save_cost/presentation/components/theme_shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
// states

abstract class AppStates {}
class AppInitialState extends AppStates{}
class DarkModeState extends AppStates {}
class LightState extends AppStates {}


//cubit
class AppCubit extends Cubit <AppStates>
{
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark=false;
//ThemeMode appMode =ThemeMode.dark;

  void changeAppMode ()
  {
     isDark =! isDark;
     if(isDark){
       emit(DarkModeState());
     }else{
       emit(LightState());
     }

   //
    //CacheHelper.putBoolean(key: "isDark", value: isDark).then((value){

    //});

  }

}


// class ThemeModel extends ChangeNotifier {
//
//
//   bool isDark =false;
//     ThemeSharedPreferences themeSharedPreferences= ThemeSharedPreferences();
//
//  bool get isDarkMode => isDark;
//
//
//  ThemeMode () async {
//    isDark =false;
//   themeSharedPreferences=ThemeSharedPreferences();
//    //SharedPreferences sharedpreferences =await SharedPreferences.getInstance();
//    getThemePreferences();
//  }
//
//  set isDarkMode (bool value)
//  {
//     isDark = value;
//     themeSharedPreferences.setTheme(value);
//     notifyListeners();
//  }
//
//  getThemePreferences()async{
//    isDark =await themeSharedPreferences.getTheme();
//    notifyListeners();
//  }
//
// }



// class MyThemes
// {
//    static final darkTheme = ThemeData(
//      primarySwatch: Colors.purple,
//      scaffoldBackgroundColor: HexColor('333739'),
//      appBarTheme: AppBarTheme(
//        titleSpacing: 20.0,
//        systemOverlayStyle:SystemUiOverlayStyle(
//          statusBarColor: HexColor('333739'),
//          statusBarBrightness:Brightness.light,
//        ) ,
//        backgroundColor:HexColor('333739'),
//        elevation:0.0 ,
//        titleTextStyle: TextStyle(
//          color: Colors.white,
//          fontSize: 20.0,
//          fontWeight: FontWeight.bold,
//        ),
//        iconTheme: IconThemeData(
//          color:Colors.white,
//
//        ) ,
//      ),
//      floatingActionButtonTheme: FloatingActionButtonThemeData(
//        backgroundColor: Colors.purple,
//      ),
//      bottomNavigationBarTheme: BottomNavigationBarThemeData(
//        type: BottomNavigationBarType.fixed,
//        selectedItemColor: Colors.purple,
//        unselectedItemColor:Colors.grey ,
//        elevation: 20.0,
//        backgroundColor: HexColor('333739') ,
//      ),
//      textTheme: TextTheme(
//        bodyText1: TextStyle(
//          fontSize: 18.0,
//          fontWeight: FontWeight.w600,
//          color: Colors.white,
//        ),
//      ),
//    );
//
//
//    static final lightTheme = ThemeData(
//      primarySwatch: Colors.purple,
//      scaffoldBackgroundColor: Colors.white,
//      appBarTheme:const AppBarTheme(
//        titleSpacing: 20.0,
//        systemOverlayStyle:SystemUiOverlayStyle(
//          statusBarColor: Colors.grey,
//          statusBarBrightness:Brightness.dark,
//        ) ,
//        backgroundColor: Colors.white,
//        elevation:0.0 ,
//        centerTitle: true,
//        titleTextStyle: TextStyle(
//          color: Colors.black,
//          fontSize: 20.0,
//          fontWeight: FontWeight.bold,
//        ),
//        iconTheme: IconThemeData(
//          color:Colors.black,
//
//        ) ,
//
//      ),
//
//      floatingActionButtonTheme:const FloatingActionButtonThemeData(
//        backgroundColor: Colors.purple,
//      ),
//      bottomNavigationBarTheme:const BottomNavigationBarThemeData(
//        type: BottomNavigationBarType.fixed,
//        selectedItemColor: Colors.purple,
//        unselectedItemColor:Colors.grey ,
//        elevation: 20.0,
//        backgroundColor: Colors.white ,
//      ),
//      textTheme: TextTheme(
//        bodyText1: TextStyle(
//          fontSize: 18.0,
//          fontWeight: FontWeight.w600,
//          color: Colors.black,
//        ),
//      ),
//    );
// }

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.dark(background: Colors.white),
  backgroundColor: HexColor('333739'),
  iconTheme: IconThemeData(
    color:Colors.white,

  ),
  primarySwatch: Colors.purple,
  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(toolbarTextStyle: TextStyle(color: Colors.green),
    titleSpacing: 20.0,
    systemOverlayStyle:SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarBrightness:Brightness.light,
    ) ,
    backgroundColor: HexColor('333739'),

    elevation:0.0 ,

    titleTextStyle:
    TextStyle(
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
    subtitle2: TextStyle(

      fontStyle:FontStyle.italic,

      color: Colors.white,
      fontSize: 30,

    ),

    bodyText2: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w800,
      color: Colors.white,
    ),

    subtitle1: TextStyle(
      fontSize: 14,
      height: 1.3,
      color: Colors.white,
    ),

    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
);

ThemeData lightTheme = ThemeData(
  iconTheme: IconThemeData(
    color:Colors.black,

  ),
  backgroundColor: Colors.grey[350],
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
    subtitle2: TextStyle(

      fontStyle:FontStyle.italic,

      color: Colors.black,
      fontSize: 30,

    ),
    bodyText2: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w800,
      color: Colors.black,
    ),

    subtitle1: TextStyle(
      fontSize: 14,
      height: 1.3,
      color: Colors.black,
    ),
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
);