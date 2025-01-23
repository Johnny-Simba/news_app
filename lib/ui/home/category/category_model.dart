import 'package:flutter/material.dart';
import 'package:news_applicaiton/providers/app_theme_provider.dart';
import 'package:news_applicaiton/utils/assets_manager.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CategoryModel {
  String id;
  String title;
  String imagePath;

  CategoryModel({required this.id, required this.title, required this.imagePath});

  static List<CategoryModel> getCategoryList(BuildContext context){
    var appThemeProvider = Provider.of<AppThemeProvider>(context);

    return[
      CategoryModel(
          id: 'general', title: AppLocalizations.of(context)!.general,
          imagePath: appThemeProvider.appTheme == ThemeMode.dark ?
          AssetsManager.generalImageLight : AssetsManager.generalImageDark
      ),
      CategoryModel(
          id: 'business', title: AppLocalizations.of(context)!.business,
          imagePath: appThemeProvider.appTheme == ThemeMode.dark ?
          AssetsManager.businessImageLight : AssetsManager.businessImageDark
      ),
      CategoryModel(
          id: 'sports', title: AppLocalizations.of(context)!.sport,
          imagePath: appThemeProvider.appTheme == ThemeMode.dark ?
          AssetsManager.sportImageLight : AssetsManager.sportImageDark
      ),
      CategoryModel(
          id: 'technology', title: AppLocalizations.of(context)!.technology,
          imagePath: appThemeProvider.appTheme == ThemeMode.dark ?
          AssetsManager.technologyImageLight : AssetsManager.technologyImageDark
      ),
      CategoryModel(
          id: 'entertainment', title: AppLocalizations.of(context)!.entertainment,
          imagePath: appThemeProvider.appTheme == ThemeMode.dark ?
          AssetsManager.entertainmentImageLight : AssetsManager.entertainmentImageDark
      ),
      CategoryModel(
          id: 'health', title: AppLocalizations.of(context)!.health,
          imagePath: appThemeProvider.appTheme == ThemeMode.dark ?
          AssetsManager.healthImageLight : AssetsManager.healthImageDark
      ),
      CategoryModel(
          id: 'science', title: AppLocalizations.of(context)!.science,
          imagePath: appThemeProvider.appTheme == ThemeMode.dark ?
          AssetsManager.scienceImageLight : AssetsManager.scienceImageDark
      ),
    ];
  }
}
