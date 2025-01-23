import 'package:flutter/material.dart';
import 'package:news_applicaiton/model/SourceResponse.dart';
import 'package:news_applicaiton/ui/home/category/category_details_view_model.dart';
import 'package:news_applicaiton/ui/home/category/source_name_item.dart';
import 'package:news_applicaiton/ui/home/news/news_widget.dart';
import 'package:news_applicaiton/utils/app_colors.dart';
import 'package:provider/provider.dart';

class SourceTabWidget extends StatefulWidget {

  List<Source> sourcesList;
  SourceTabWidget({required this.sourcesList});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<CategoryDetailsViewModel>(
          builder: (context, value, child) {
            return DefaultTabController(
                length: widget.sourcesList.length,
                child: Column(
                  children: [
                    TabBar(
                      onTap: (index) {
                        viewModel.updateSelectedIndex(index);
                      },
                      tabAlignment: TabAlignment.start,
                      indicatorColor: Theme.of(context).indicatorColor,
                      dividerColor: AppColors.transparentColor,
                      isScrollable: true,
                      tabs: widget.sourcesList.map((source) {
                        return SourceNameItem(
                            source: source,
                            isSelected: viewModel.selectedIndex == widget.sourcesList.indexOf(source)
                        );
                      },).toList(),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: NewsWidget(source: widget.sourcesList[viewModel.selectedIndex]),
                      ),
                    )
                  ],
                )
            );
          },
      )
    );
  }
}
