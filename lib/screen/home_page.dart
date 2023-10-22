import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/category/category_fragment.dart';
import 'package:news/modal/category.dart';
import 'package:news/my_theme.dart';
import 'package:news/screen/home_drawer.dart';
import 'package:news/screen/settings/settings_tab.dart';
import 'package:news/category/category_details.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: MyTheme.whiteColor,
            child: Image.asset("assets/images/pattern.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            )
        ),

        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              selectedDrawerItem==HomeDrawer.settings?
                  AppLocalizations.of(context)!.settings:
              selectedCategory==null?AppLocalizations.of(context)!.new_app:selectedCategory!.title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: IconButton(onPressed: (){
                  showSearch(context: context, delegate: CustomSearch());
                }, icon: Icon(Icons.search,size: 30,)),
              ),
            ],
          ),
          drawer: Drawer(
            child: HomeDrawer(
              onDrawerItemClick: onDrawerItemClick,
            ),
          ),
          body: selectedDrawerItem==HomeDrawer.settings?
           SettingsTab():
          selectedCategory==null?
          CategoryFragments(onCategoryClick:onCategoryClick ):
              CategoryDetails(category: selectedCategory!)
          ,
        ),
      ],
    );
  }

  Category? selectedCategory;

  void onCategoryClick(Category newCategory){
    selectedCategory=newCategory;
    setState(() {

    });
  }

int selectedDrawerItem=HomeDrawer.category;
  void onDrawerItemClick(int newSelectedDrawerItem){
selectedDrawerItem=newSelectedDrawerItem;
selectedCategory=null;
Navigator.pop(context);
setState(() {

});
  }
}
class CustomSearch extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
   return [
     IconButton(onPressed: (){}, icon: Icon(Icons.search,color: MyTheme.primaryColor,size: 30,)),
   ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return  IconButton(onPressed: (){}, icon: Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
   return Text("");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
  return Text("data") ;
  }


}

