import 'package:flutter/material.dart';
import 'package:news_applicaiton/api/api_manager.dart';
import 'package:news_applicaiton/model/NewsResponse.dart';

class NewsViewModel extends ChangeNotifier{
  List<News>? newsList;
  List<News>? newNews;
  String? errorMessage;
  int pageNumber = 1;
  bool hasMore = true;
  bool isLoading = false;

  void getNewsBySourceId(String sourceId) async{
    newsList = null;
    errorMessage = null;
    notifyListeners();
    try{
      var response = await ApiManager.getNewsBySourceId(sourceId);
      if(response.status == 'error'){
        errorMessage = response.message;
      }
      else{
        newsList = response.articles;
      }
    }catch(e) {
      errorMessage = e.toString();
    }
    notifyListeners();
    print('get news');
  }
  void addPage(String sourceId) async{
    newNews = null;
    errorMessage = null;
    isLoading = true;

    notifyListeners();
    try{
      pageNumber++;
      var response = await ApiManager.getNewsByPage(sourceId, pageNumber);

      if(response.status == 'error'){
        errorMessage = response.message;
      }
      else{
        if(response.articles!.length < 100){
          hasMore = false;
        }
        newNews = response.articles;
        newsList!.addAll(newNews!);
        isLoading = false;
      }
    }catch(e) {
      errorMessage = e.toString();
    }
    notifyListeners();
    print('get news');
  }
  Future refresh() async{
    hasMore = true;
    pageNumber = 1;
    isLoading = false;
    notifyListeners();
  }

}