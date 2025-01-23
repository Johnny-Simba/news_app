import 'package:flutter/material.dart';
import 'package:news_applicaiton/utils/app_colors.dart';
import 'package:news_applicaiton/utils/app_styles.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../providers/app_theme_provider.dart';


class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {


  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              themeProvider.changeTheme(ThemeMode.dark);
            },
            child: themeProvider.appTheme == ThemeMode.dark?
            getSelectedItemWidget(AppLocalizations.of(context)!.dark):
            getUnSelectedItemWidget(AppLocalizations.of(context)!.dark),
          ),
          SizedBox(height: height*0.019
            ,),
          InkWell(
            onTap: () {

              themeProvider.changeTheme(ThemeMode.light);
            },
            child: themeProvider.appTheme == ThemeMode.light?
            getSelectedItemWidget(AppLocalizations.of(context)!.light):
            getUnSelectedItemWidget(AppLocalizations.of(context)!.light),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
          style: AppStyles.bold20White,),
        Icon(Icons.check,size: 25,color: AppColors.whiteColor,)
      ],
    );
  }
  Widget getUnSelectedItemWidget(String text){
    return Text(text, style: AppStyles.bold20White,);
  }
}
