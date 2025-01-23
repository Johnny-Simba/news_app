import 'package:flutter/material.dart';
import 'package:news_applicaiton/ui/home/category/category_details.dart';
import 'package:news_applicaiton/ui/home/category/category_fragment.dart';
import 'package:news_applicaiton/ui/home/category/category_model.dart';
import 'package:news_applicaiton/ui/home/drawer/home_drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( selectedCategory == null ?
          AppLocalizations.of(context)!.home :
          selectedCategory!.title,style: Theme.of(context).textTheme.headlineLarge,),
        iconTheme: Theme.of(context).iconTheme,
        actions: [
          IconButton(onPressed: (){}, 
              icon: Icon(Icons.search_outlined,size: 30,))
        ],
      ),
      drawer: Drawer(
        child: HomeDrawer(onDrawerItemClicked: onDrawerItemClicked,),
        backgroundColor: AppColors.blackColor,
        clipBehavior: Clip.none,
      ),
      body: NotificationListener(
        onNotification: (notification) {
          return true;
        },
          child: selectedCategory == null ?
          CategoryFragment(onViewAllClicked: onViewAllClicked,) :
          CategoryDetails(category: selectedCategory!,)
      ),
    );
  }

  CategoryModel? selectedCategory;

  void onViewAllClicked(CategoryModel newSelectedCategory){
    selectedCategory = newSelectedCategory;
    setState(() {

    });
  }
  void onDrawerItemClicked(){
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {

    });
  }
}
