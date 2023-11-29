
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService{
  static late SharedPreferences _prefs ;
 static Future<void> init()async{
   _prefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences prefs()=> _prefs ;
}