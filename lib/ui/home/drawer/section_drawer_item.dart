import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_applicaiton/utils/app_colors.dart';
import 'package:news_applicaiton/utils/app_styles.dart';

class SectionDrawerItem extends StatelessWidget {
  String imagePath;
  String text;
  SectionDrawerItem({required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        ImageIcon(AssetImage(imagePath),color: AppColors.whiteColor,),
        SizedBox(width: width * 0.02,),
        Text(text,style: AppStyles.bold20White,)
      ],
    );
  }
}
