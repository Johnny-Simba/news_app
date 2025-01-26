import 'package:flutter/material.dart';
import 'package:news_applicaiton/ui/home/home_screen.dart';
import 'package:news_applicaiton/ui/home/news/news_item.dart';
import 'package:news_applicaiton/ui/home/search/search_view_model.dart';
import 'package:provider/provider.dart';

class SearchView extends StatefulWidget {
  static const String routeName = 'Search';

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  SearchViewModel viewModel = SearchViewModel();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<SearchViewModel>(
        child: TextField(
          onChanged: (text) {
            viewModel.controller.text = text;
            viewModel.getSourcesByQuery(viewModel.controller.text);
          },
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.search_outlined,color: Theme.of(context).indicatorColor,),
              suffixIcon: IconButton(onPressed: (){
                Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
              }, icon: Icon(Icons.close,color: Theme.of(context).indicatorColor,)),
              hintText: 'Search',
              hintStyle: Theme.of(context).textTheme.labelLarge,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                      width: 2,
                      color: Theme.of(context).indicatorColor
                  )
              )
          ),
        ),
        builder: (context, value, child) {
          if(viewModel.controller.text.isEmpty){
            return Scaffold(
              body: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04,
                  vertical: height * 0.06,
                ),
                child: Column(
                  children: [
                    child!,
                    SizedBox(height: 300,),
                    Center(child: Text("Search about news by it's title, description or content"
                      ,style: Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center,))
                  ],
                ),
              ),
            );
          }else if(viewModel.errorMessage != null){
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    child!,
                    Text(viewModel.errorMessage!,
                      textAlign: TextAlign.center,),
                    const SizedBox(height: 20,),
                    ElevatedButton(onPressed: (){
                      viewModel.getSourcesByQuery(viewModel.controller.text);
                    },
                        child: const Text('Try Again'))
                  ],
                ),
              ),
            );
          }else if(viewModel.newsList == null){
            return Scaffold(
              body: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04,
                  vertical: height * 0.06,
                ),
                child: Column(
                  children: [
                    child!,
                    SizedBox(height: 300,),
                    Center(child: Text("Search about news by it's title, description or content"
                    ,style: Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center,))
                  ],
                ),
              ),
            );
          }else{
            return Scaffold(
              body: Padding(
                padding : EdgeInsets.symmetric(
                  horizontal: width * 0.04,
                  vertical: height * 0.06,
                ),
                child: Column(
                  children: [
                    child!,
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return NewsItem(news: viewModel.newsList![index]);
                        },
                        itemCount: viewModel.newsList!.length,
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          
        },
      ),
    );
  }
}
