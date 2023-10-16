import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/my_theme.dart';
import 'package:news/widget/drawer_icon_text.dart';

class HomeDrawer extends StatelessWidget {
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
          onTap: (){},
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
