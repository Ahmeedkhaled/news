import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerIconText extends StatelessWidget {
String name;
IconData icon;
DrawerIconText({required this.name,required this.icon});
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          Icon(icon,size: 35,),
          SizedBox(width: 10,),
          Text(name,style: Theme.of(context).textTheme.titleMedium,),
        ],
      ),
    );

  }
}
