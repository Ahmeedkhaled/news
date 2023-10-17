import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AppLanguage extends ChangeNotifier{

  String appLanguage="en";

  void changeLanguage(String newLanguage)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(appLanguage==newLanguage){
      return;
    }
    prefs.setString("language", appLanguage);
    appLanguage=newLanguage;
    notifyListeners();
  }



}