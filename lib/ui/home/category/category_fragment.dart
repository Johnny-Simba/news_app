import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_applicaiton/ui/home/category/category_model.dart';
import 'package:news_applicaiton/ui/home/category/view_all_item.dart';

class CategoryFragment extends StatelessWidget {
  Function onViewAllClicked;
  CategoryFragment({required this.onViewAllClicked});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var categoriesList = CategoryModel.getCategoryList(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: 0.018,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.good_morning,
          style: Theme.of(context).textTheme.bodyLarge,),
          Text(AppLocalizations.of(context)!.here_is_some_news_for_you,
          style: Theme.of(context).textTheme.bodyLarge,),
          SizedBox(height: height * 0.018,),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Stack(
                  alignment: index % 2 == 0 ?
                  Alignment.bottomRight : Alignment.bottomLeft,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(categoriesList[index].imagePath),
                    ),
                    InkWell(
                      onTap: () {
                        onViewAllClicked(categoriesList[index]);
                      },
                      child: ViewAllItem(onTheRight: index % 2 == 0),
                    ),
                  ],
                );
              },
              itemCount: categoriesList.length,
              separatorBuilder: (context, index) {
                return SizedBox(height: height * 0.02,);
              },
            ),
          ),
          SizedBox(height: height * 0.01,)
        ],
      ),
    );
  }
}
