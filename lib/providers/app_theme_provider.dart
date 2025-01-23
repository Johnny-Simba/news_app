import 'package:flutter/material.dart';


class AppThemeProvider extends ChangeNotifier{
  bool? isDarkTheme;
  ThemeMode? appTheme = ThemeMode.light;


  void changeTheme(ThemeMode newTheme){
    if(appTheme == newTheme){
      return;
    }
    appTheme = newTheme;
    notifyListeners();
  }


}