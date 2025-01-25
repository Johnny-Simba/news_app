import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_applicaiton/api/api_manager.dart';
import 'package:news_applicaiton/ui/home/news/cubit/news_states.dart';

class NewsViewModel extends Cubit<NewsState>{
  NewsViewModel():super(NewsLoadingState());
  void getNewsBySourceId(String sourceId) async{
    try{
      emit(NewsLoadingState());
      var response = await ApiManager.getNewsBySourceId(sourceId);
      if(response.status == 'error'){
        emit(NewsErrorState(errorMessage: response.message!));
        return;
      }else{
        emit(NewsSuccessState(sourceList: response.articles!));
      }
    }
    catch(e){
      emit(NewsErrorState(errorMessage: e.toString()));
    }
  }
}