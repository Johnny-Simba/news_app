import 'package:flutter/material.dart';
import 'package:news_applicaiton/model/SourceResponse.dart';
import 'package:news_applicaiton/ui/home/news/news_item.dart';
import 'package:news_applicaiton/ui/home/news/news_view_model.dart';
import 'package:provider/provider.dart';

class NewsWidget extends StatefulWidget {
  final Source source;
  NewsWidget({required this.source, Key? key}) : super(key: key);

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {

  NewsViewModel newsViewModel = NewsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    print('Init State of News Widget');
    super.initState();
    newsViewModel.getNewsBySourceId(widget.source.id!);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => newsViewModel,
      child: Consumer<NewsViewModel>(
          builder: (context, value, child) {
            if(newsViewModel.errorMessage != null){
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(newsViewModel.errorMessage!,
                    textAlign: TextAlign.center,),
                    const SizedBox(height: 20,),
                    ElevatedButton(onPressed: (){
                      newsViewModel.getNewsBySourceId(widget.source.id!);
                      },
                        child: const Text('Try Again'))
                  ],
                ),
              );
            }else if(newsViewModel.newsList == null){
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).indicatorColor
                ),
              );
            }else{
              return RefreshIndicator(
                onRefresh: newsViewModel.refresh,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    if(index < newsViewModel.newsList!.length){
                      return NewsItem(news: newsViewModel.newsList![index]);
                    }else if(newsViewModel.isLoading){
                      return Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).indicatorColor
                        ),
                      );
                    }
                    else{
                      return Center(
                        child: newsViewModel.hasMore ?
                        InkWell(
                          onTap: () {
                            newsViewModel.addPage(widget.source.id!);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Theme.of(context).indicatorColor
                            ),
                            child: Text('Load More News', style: Theme.of(context).textTheme.bodyMedium,),
                          ),
                        )
                        :Text('No More News',style: Theme.of(context).textTheme.labelLarge,),
                      );
                    }
                  },
                  itemCount: newsViewModel.newsList!.length + 1,
                ),
              );
            }
          },
      ),
    );
  }
}
