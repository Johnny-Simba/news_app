import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_applicaiton/api/api_constant.dart';
import 'package:news_applicaiton/api/end_points.dart';
import 'package:news_applicaiton/model/NewsResponse.dart';
import 'package:news_applicaiton/model/SourceResponse.dart';

/*
https://newsapi.org/v2/everything?q=bitcoin&apiKey=4580446ae1124801b59b413dc6f9fd49
*/

class ApiManager{
  static Future<SourceResponse> getSources(String categoryId) async{
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.sourceApi, {
      'apiKey' : ApiConstants.apiKey,
      'category' : categoryId
    });
    try{
      var response = await http.get(url);
      return SourceResponse.fromJson(jsonDecode(response.body));
    }catch(e){
      throw e;
    }
  }

  static Future<NewsResponse> getNewsBySourceId(String sourceId) async{
    Uri url = Uri.https(
        ApiConstants.baseUrl,
        EndPoints.newsApi,
        {
          'apiKey' : ApiConstants.apiKey,
          'sources' : sourceId
        }
    );
    try{
      var response = await http.get(url);
      return NewsResponse.fromJson(jsonDecode(response.body));
    }catch(e){
      throw e;
    }
  }
}