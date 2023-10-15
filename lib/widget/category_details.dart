import 'package:flutter/material.dart';
import 'package:news/api_manager.dart';
import 'package:news/modal/SourcesRespon.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/tabs/tabs.dart';
class CategoryDetails extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesRespon>(
      future: ApiManager.getSource(),
      builder:(context, snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ),);
        }else if(snapshot.hasError){
          return Column(
            children: [
              Text(AppLocalizations.of(context)!.something_went_wrong),
              ElevatedButton(onPressed: (){}, child: Text(AppLocalizations.of(context)!.try_again))
            ],
          );
        }
        if(snapshot.data?.status !='ok'){
          return Column(
            children: [
              Text(snapshot.data?.message??""),
              ElevatedButton(onPressed: (){}, child: Text(AppLocalizations.of(context)!.try_again))
            ],
          );
        }
        var sourceList=snapshot.data?.sources??[];
        return TabContainer(sourceList: sourceList);


      },
    );
  }
}
