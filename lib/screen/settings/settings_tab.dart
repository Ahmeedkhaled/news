
import 'package:flutter/material.dart';
import 'package:news/my_theme.dart';
import 'package:news/providers/language.dart';
import 'package:news/screen/settings/change_language.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatefulWidget {

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppLanguage>(context);
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,style:
              Theme.of(context).textTheme.titleMedium
            ),
          InkWell(
            onTap: (){
              showChangeLanguage();
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height*0.04,
                horizontal: MediaQuery.of(context).size.height*0.01,

              ),
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height*0.01,
                horizontal: MediaQuery.of(context).size.height*0.01,
              ),
              decoration: BoxDecoration(
                border:Border.all(
                  width: 2,
                  color: Theme.of(context).primaryColor
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.appLanguage=="en"?
                      AppLocalizations.of(context)!.english:
                  AppLocalizations.of(context)!.arabic

                  ,style:Theme.of(context).textTheme.bodySmall, ),
                  Icon(Icons.arrow_drop_down,color: MyTheme.primaryColor,)
                ],
              ),
            ),
          ),


        ],
      ),
    ) ;
  }

  void showChangeLanguage() {
    showModalBottomSheet(
        context: context, builder: (context)=>ScreenChangeLanguage());
  }

}


