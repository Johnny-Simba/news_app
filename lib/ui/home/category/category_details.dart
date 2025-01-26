import 'package:flutter/material.dart';
import 'package:news_applicaiton/ui/home/category/category_details_view_model.dart';
import 'package:news_applicaiton/ui/home/category/category_model.dart';
import 'package:news_applicaiton/ui/home/category/source_tab_widget.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'Category-Details';
  CategoryModel category;
  CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel categoryDetailsViewModel = CategoryDetailsViewModel();
  @override
  void initState() {
    // TODO: implement initState
    print('Init State of category details ');
    super.initState();
    categoryDetailsViewModel.getSources(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => categoryDetailsViewModel,
      child: Consumer<CategoryDetailsViewModel>(
          builder: (context, value, child) {
            if(categoryDetailsViewModel.errorMessage != null){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(categoryDetailsViewModel.errorMessage!,
                    style: Theme.of(context).textTheme.labelLarge,
                    textAlign: TextAlign.center,),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: (){
                      categoryDetailsViewModel.getSources(widget.category.id);
                    },
                    child: const Text('Try Again'),
                  )
                ],
              );
            }
            if(categoryDetailsViewModel.sourcesList == null){
              return const Center(child: CircularProgressIndicator(
                color: Colors.teal,
              ));
            }
            else{
              return SourceTabWidget(sourcesList: categoryDetailsViewModel.sourcesList!,);
            }
          },
      ),
    );
  }
}
