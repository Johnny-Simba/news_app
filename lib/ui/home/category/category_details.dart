import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_applicaiton/ui/home/category/category_model.dart';
import 'package:news_applicaiton/ui/home/category/cubit/source_states.dart';
import 'package:news_applicaiton/ui/home/category/cubit/source_view_model.dart';
import 'package:news_applicaiton/ui/home/category/source_tab_widget.dart';


class CategoryDetails extends StatefulWidget {
  static const String routeName = 'Category-Details';
  CategoryModel category;
  CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  SourceViewModel viewModel = SourceViewModel();

  @override
  void initState() {
    // TODO: implement initState
    print('Init State of category details ');
    super.initState();
    viewModel.getSources(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<SourceViewModel,SourceState>(
          builder: (context, state) {
            if(state is SourceErrorState){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(state.errorMessage,textAlign: TextAlign.center,),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: (){
                      viewModel.getSources(widget.category.id);
                      },
                    child: const Text('Try Again'),
                  )
                ],
              );
            }else if(state is SourceSuccessState){
              return SourceTabWidget(sourcesList: state.sourceList,);
            }else{
              return Center(child: CircularProgressIndicator(
                  color: Theme.of(context).indicatorColor
              ));
            }
          },
      ),
    );
  }
}
