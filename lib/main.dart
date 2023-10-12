import 'package:flutter/material.dart';
import 'package:news/my_theme.dart';
import 'package:news/screen/home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:HomePage.routeName ,
      routes: {
        HomePage.routeName:(context)=>HomePage(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme:MyTheme.lightMode,
    );
  }

}