import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_applicaiton/model/SourceResponse.dart';
import 'package:news_applicaiton/ui/home/news/cubit/news_states.dart';
import 'package:news_applicaiton/ui/home/news/cubit/news_view_model.dart';
import 'package:news_applicaiton/ui/home/news/news_item.dart';

class NewsWidget extends StatefulWidget {
  final Source source;
  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {

  NewsViewModel viewModel = NewsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id!);
  }

  @override
  Widget build(BuildContext context) {
    viewModel.getNewsBySourceId(widget.source.id!);
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<NewsViewModel,NewsState>(
          builder: (context, state) {
            if(state is NewsErrorState){
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.errorMessage,
                      textAlign: TextAlign.center,),
                    const SizedBox(height: 20,),
                    ElevatedButton(onPressed: (){
                      viewModel.getNewsBySourceId(widget.source.id!);
                      },
                        child: const Text('Try Again'))
                  ],
                ),
              );
            }else if(state is NewsSuccessState){
              return ListView.builder(
                  itemBuilder: (context, index) {
                    return NewsItem(news: state.sourceList[index]);
                  },
                itemCount: state.sourceList.length,
              );
            }else{
              return Center(
                child: CircularProgressIndicator(
                    color: Theme.of(context).indicatorColor
                ),
              );
            }
          },
      ),
    );
  }
}


