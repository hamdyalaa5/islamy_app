import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamy_app/home/settings/Language_bottom_sheet.dart';
import 'package:islamy_app/home/settings/theme_bottom_sheet.dart';
import 'package:islamy_app/providers/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SettingsTab extends StatefulWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.theme, style: Theme.of(context).textTheme.subtitle2,),
          SizedBox(height:8,),
          InkWell(
            onTap: (){
              showThemeBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border:Border.all(color: Theme.of(context).accentColor,
                width:1),
              ),
              child:Text(
            settingsProvider.isDarkMode()?AppLocalizations.of(context)!.dark:
                  AppLocalizations.of(context)!.light,
                  style: Theme.of(context).textTheme.headline6),
            ),
          ),
          SizedBox(height: 8,),

          Text(AppLocalizations.of(context)!.language, style: Theme.of(context).textTheme.subtitle2,),
          SizedBox(height: 8,),
          InkWell(
            onTap:() {
              showLanguageBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border:Border.all(color: Theme.of(context).accentColor, width:1),
              ),
              child:Text(
                  settingsProvider.currentLang=='en'?'English'
                 :'العربية',
                  style: Theme.of(context).textTheme.headline6),
            ),
          )
        ],
      )
    );
  }

  void showThemeBottomSheet(){
    showModalBottomSheet(context: context, builder: (buildContext){
      return ThemeBottomSheet();
    });
  }
  void showLanguageBottomSheet(){
    showModalBottomSheet(context: context, builder: (buildContext){
      return LanguageBottomSheet();
    });
  }
}
