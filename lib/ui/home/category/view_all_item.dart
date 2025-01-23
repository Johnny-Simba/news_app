import 'package:flutter/material.dart';
import 'package:news_applicaiton/providers/app_language_provider.dart';
import 'package:news_applicaiton/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_applicaiton/utils/assets_manager.dart';
import 'package:provider/provider.dart';

class ViewAllItem extends StatelessWidget {
  bool onTheRight;
  ViewAllItem({required this.onTheRight});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var appLanguageProvider = Provider.of<AppLanguageProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.018,
      ),
      alignment: Alignment.center,
      height: height * 0.06,
      width: width * 0.43,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(84),
        color: AppColors.greyColor,
      ),
      child: onTheRight ?
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: appLanguageProvider.appLanguage == 'en' ?
            EdgeInsets.only(left: width * 0.04,) :
            EdgeInsets.only(right: width * 0.04,),
            child: Text(AppLocalizations.of(context)!.view_all,
              style: Theme.of(context).textTheme.bodyLarge,),
          ),
          Container(
            height: height * 0.06,
            width: width * 0.137,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: ImageIcon(AssetImage(appLanguageProvider.appLanguage == 'en' ?
            AssetsManager.arrowIcon : AssetsManager.leftArrowIcon,),
              color: Theme.of(context).indicatorColor,),
          )
        ],
      )
          :
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: height * 0.06,
            width: width * 0.137,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: ImageIcon(AssetImage(appLanguageProvider.appLanguage == 'en' ?
            AssetsManager.leftArrowIcon : AssetsManager.arrowIcon,),
              color: Theme.of(context).indicatorColor,),
          ),
          Padding(
            padding: appLanguageProvider.appLanguage == 'en' ?
            EdgeInsets.only(right: width * 0.04,) :
            EdgeInsets.only(left: width * 0.04,),
            child: Text(AppLocalizations.of(context)!.view_all,
              style: Theme.of(context).textTheme.bodyLarge,),
          )
        ],
      )
    );
  }
}
