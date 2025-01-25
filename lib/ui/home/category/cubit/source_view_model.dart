import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_applicaiton/api/api_manager.dart';
import 'package:news_applicaiton/ui/home/category/cubit/source_states.dart';

class SourceViewModel extends Cubit<SourceState>{
  SourceViewModel():super(SourceLoadingState());

  void getSources(String categoryId) async{
    try{
      emit(SourceLoadingState());
      var response = await ApiManager.getSources(categoryId);
      if(response.status == 'error'){
        emit(SourceErrorState(errorMessage: response.message!));
        return;
      }
      else{
       emit(SourceSuccessState(sourceList: response.sources!));
       return;
      }
    }
    catch(e){
      emit(SourceErrorState(errorMessage: e.toString()));
    }
  }
}