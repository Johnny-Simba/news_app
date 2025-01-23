import 'package:flutter/material.dart';
import 'package:news_applicaiton/model/SourceResponse.dart';
import 'package:news_applicaiton/providers/app_theme_provider.dart';
import 'package:news_applicaiton/ui/home/news/news_item.dart';
import 'package:news_applicaiton/ui/home/news/news_view_model.dart';
import 'package:news_applicaiton/utils/app_colors.dart';
import 'package:provider/provider.dart';

class NewsWidget extends StatefulWidget {
  final Source source;
  NewsWidget({Key? key, required this.source}) : super(key: key);

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsViewModel newsViewModel = NewsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsViewModel.getNewsBySourceId(widget.source.id!);
  }

  @override
  Widget build(BuildContext context) {
    var appThemeProvider = Provider.of<AppThemeProvider>(context);
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
                  color: appThemeProvider.appTheme == ThemeMode.dark ?
                  AppColors.whiteColor : AppColors.blackColor,
                ),
              );
            }else{
              return ListView.builder(
                itemBuilder: (context, index) {
                  return NewsItem(news: newsViewModel.newsList![index]);
                  },
                itemCount: newsViewModel.newsList!.length,
              );
            }
          },
      ),
    );
  }
}
