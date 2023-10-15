import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/api_manager.dart';
import 'package:news/modal/SourcesRespon.dart';
import 'package:news/my_theme.dart';
import 'package:news/tabs/tabs.dart';
import 'package:news/widget/category_details.dart';
import 'package:news/widget/drawer_icon_text.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "home_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.new_app,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(onPressed: (){
              // search delget
            }, icon: Icon(Icons.search,size: 30,)),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height*0.1
              ),
              decoration: BoxDecoration(
                color: MyTheme.primaryColor,

              ),
                child: Text(
              AppLocalizations.of(context)!.new_app,
              style: Theme.of(context).textTheme.titleSmall,
            ),
              alignment: Alignment.center,
            ),
            DrawerIconText(name: AppLocalizations.of(context)!.categories, icon: Icons.list),
            DrawerIconText(name: AppLocalizations.of(context)!.settings, icon: Icons.settings),
          ],
        ),
      ),
      body: CategoryDetails(),
    );
  }
}
