import 'package:flutter/material.dart';
import 'package:news_applicaiton/api/api_manager.dart';
import 'package:news_applicaiton/model/SourceResponse.dart';

class CategoryDetailsViewModel extends ChangeNotifier{
  List<Source>? sourcesList;
  String? errorMessage;
  int selectedIndex = 0;

  void getSources(String categoryId) async{
    sourcesList = null;
    errorMessage = null;
    notifyListeners();
    try{
      var response = await ApiManager.getSources(categoryId);
      if(response.status == 'error'){
        errorMessage = response.message;
      }
      else{
        sourcesList = response.sources;
      }
    }
    catch(e){
      errorMessage = e.toString();
    }
    notifyListeners();
  }

  void updateSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners(); // Notify listeners to rebuild UI
  }
}

