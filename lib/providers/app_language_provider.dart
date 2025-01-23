import 'package:flutter/material.dart';

class AppLanguageProvider extends ChangeNotifier{
  bool? isEn;
  String appLanguage = 'en';

  void changeLanguage(String newLanguage){
    if(appLanguage == newLanguage){
      return;
    }
    appLanguage = newLanguage;
    notifyListeners();
  }

}