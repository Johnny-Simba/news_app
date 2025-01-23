import 'package:flutter/material.dart';
import 'package:news_applicaiton/providers/app_language_provider.dart';
import 'package:news_applicaiton/providers/app_theme_provider.dart';
import 'package:news_applicaiton/ui/home/drawer/language_bottom_sheet.dart';
import 'package:news_applicaiton/ui/home/drawer/section_drawer_item.dart';
import 'package:news_applicaiton/ui/home/drawer/theme_bottom_sheet.dart';
import 'package:news_applicaiton/utils/app_styles.dart';
import 'package:news_applicaiton/utils/assets_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../utils/app_colors.dart';

class HomeDrawer extends StatefulWidget {
  Function onDrawerItemClicked;
  HomeDrawer({required this.onDrawerItemClicked});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var appThemeProvider = Provider.of<AppThemeProvider>(context);
    var appLanguageProvider = Provider.of<AppLanguageProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          alignment: Alignment.center,
          color: AppColors.whiteColor,
          height: height * 0.2,
          child: Text(AppLocalizations.of(context)!.news_app,
          style: AppStyles.bold24Black,),
        ),
        Padding(
            padding: EdgeInsets.symmetric(
              vertical: height * 0.019,
              horizontal: width * 0.04,
            ),
          child: Column(
            children: [
              SizedBox(height: height * 0.019,),
              InkWell(
                onTap: () {
                  // todo : Go to home screen
                  widget.onDrawerItemClicked();
                },
                child: SectionDrawerItem(imagePath: AssetsManager.homeIcon,
                    text: AppLocalizations.of(context)!.go_to_home)),
              SizedBox(height: height * 0.02,),
              Divider(thickness: 1, color: AppColors.whiteColor,),
              SizedBox(height: height * 0.02,),
              SectionDrawerItem(imagePath: AssetsManager.themeIcon, text: AppLocalizations.of(context)!.theme),
              SizedBox(height: height * 0.02,),
              InkWell(
                onTap: () {
                  showThemeBottomSheet();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04
                  ),
                  height: height * 0.06,
                  decoration: BoxDecoration(
                   border: Border.all(
                     color: AppColors.whiteColor,
                     width: 1,
                   ),
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(appThemeProvider.appTheme == ThemeMode.dark ?
                      AppLocalizations.of(context)!.dark : AppLocalizations.of(context)!.light, style: AppStyles.medium20White,),
                      Icon(Icons.arrow_drop_down_rounded,color: AppColors.whiteColor,)
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.02,),
              Divider(thickness: 1, color: AppColors.whiteColor,),
              SizedBox(height: height * 0.02,),
              SectionDrawerItem(imagePath: AssetsManager.languageIcon, text: AppLocalizations.of(context)!.language),
              SizedBox(height: height * 0.02,),
              InkWell(
                onTap: () {
                  showLanguageBottomSheet();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.04
                  ),
                  height: height * 0.06,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.whiteColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(appLanguageProvider.appLanguage == 'en' ?
                      AppLocalizations.of(context)!.english :
                        AppLocalizations.of(context)!.arabic, style: AppStyles.medium20White,),
                      Icon(Icons.arrow_drop_down_rounded,color: AppColors.whiteColor,)
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(context: context,
      backgroundColor: AppColors.blackColor,
      builder: (context) {
        return LanguageBottomSheet();
      },);
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(context: context,
      backgroundColor: AppColors.blackColor,
      builder: (context) {
        return ThemeBottomSheet();
      },);
  }
}
