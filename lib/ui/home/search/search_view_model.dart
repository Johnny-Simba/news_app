import 'package:flutter/material.dart';
import 'package:news_applicaiton/api/api_manager.dart';
import 'package:news_applicaiton/model/NewsResponse.dart';

class SearchViewModel extends ChangeNotifier{
  List<News>? newsList;
  String? errorMessage;
  TextEditingController controller = TextEditingController();

  void getSourcesByQuery(String query) async{
    try{
      var response = await ApiManager.getNewsByQuery(query);
      if(response.status == 'error'){
        errorMessage = response.message;
      }
      else{
        newsList = response.articles;
      }
    }
    catch(e){
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}