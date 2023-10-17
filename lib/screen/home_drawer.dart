import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/my_theme.dart';

class HomeDrawer extends StatelessWidget {
  static const int category=1;
  static const int settings=2;
  Function onDrawerItemClick;
  HomeDrawer({required this.onDrawerItemClick});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.1),
          decoration: BoxDecoration(
            color: MyTheme.primaryColor,
          ),
          child: Text(
            AppLocalizations.of(context)!.new_app,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          alignment: Alignment.center,
        ),
        InkWell(
          onTap: (){
            onDrawerItemClick(HomeDrawer.category);
          },
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                Icon(
                  Icons.list,
                  size: 35,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.categories,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: (){
            onDrawerItemClick(HomeDrawer.settings);

          },
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                  size: 35,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.settings,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }
}
