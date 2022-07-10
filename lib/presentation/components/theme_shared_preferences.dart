
import 'package:shared_preferences/shared_preferences.dart';
//  class ThemeSharedPreferences
// {
//   static const PREF_KEY ='preferences';
//   setTheme (bool value) async
// {
//   SharedPreferences sharedpreferences =await SharedPreferences.getInstance();
//   sharedpreferences.setBool( PREF_KEY, value);
// }
//  getTheme() async{
//   SharedPreferences sharedpreferences =await SharedPreferences.getInstance();
//   return sharedpreferences.getBool(PREF_KEY) ?? false;
// }
//  }






class CacheHelper
{
  static late SharedPreferences sharedPreferences  ;

  static init () async
  {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putBoolean({
    required String key,
    required bool value,
  })async
  {
    return await sharedPreferences.setBool(key,value );
  }

  static bool getBoolean({
    required String key,
  })
  {
    return sharedPreferences.getBool(key) ?? false;
  }

}