import 'package:flutter/material.dart';
import 'package:news/my_theme.dart';
import 'package:news/news/news_details.dart';
import 'package:news/providers/language.dart';
import 'package:news/screen/home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(ChangeNotifierProvider(
    create: (context) => AppLanguage(),
      child: MyApp())
  );
}
class MyApp extends StatelessWidget{
 late AppLanguage provider;
  @override
  Widget build(BuildContext context) {
     provider=Provider.of<AppLanguage>(context);
     initSharedPreferences();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:HomePage.routeName ,
      routes: {
        HomePage.routeName:(context)=>HomePage(),
        NewsDetails.routeName:(context)=>NewsDetails(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme:MyTheme.lightMode,
      locale:Locale(provider.appLanguage),
    );
  }

  Future<void> initSharedPreferences()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
   var language= prefs.getString("language");
   if(language !=null){
     provider.changeLanguage(language);
   }

  }

}