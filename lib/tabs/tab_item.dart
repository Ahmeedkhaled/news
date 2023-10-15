import 'package:flutter/material.dart';
import 'package:news/modal/SourcesRespon.dart';
import 'package:news/my_theme.dart';

class TabItem extends StatelessWidget {
bool isSelected;
Source source;
TabItem({required this.source,required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.03),
      padding: EdgeInsets.symmetric(
        vertical:MediaQuery.of(context).size.height*0.01,
        horizontal:MediaQuery.of(context).size.width*0.02,
      ),
      decoration: BoxDecoration(
        color: isSelected ?Theme.of(context).primaryColor:Colors.transparent,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 3
        ),
      ),
      child: Text(
        source.name??"",
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: isSelected?MyTheme.whiteColor:Theme.of(context).primaryColor
        ),
      ),
    );
  }
}
