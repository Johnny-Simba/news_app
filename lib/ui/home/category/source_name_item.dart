import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_applicaiton/model/SourceResponse.dart';
import 'package:news_applicaiton/utils/app_styles.dart';

class SourceNameItem extends StatelessWidget {
  Source source;
  bool isSelected;
  SourceNameItem({required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Text(source.name ?? '',
    style: isSelected ? Theme.of(context).textTheme.labelLarge : Theme.of(context).textTheme.labelMedium
    );
  }
}
