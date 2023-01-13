import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static SharedPreferences? _sharedPreferences;
  static   init()async{
     _sharedPreferences=await SharedPreferences.getInstance();
  }
  static Future<bool> setData({
    required String key,
    required bool? value
  })async{
   return await _sharedPreferences!.setBool(key, value!);
  }
   static bool? getData({
    required String key
   }){
    return _sharedPreferences!.getBool(key);
   }
  
}