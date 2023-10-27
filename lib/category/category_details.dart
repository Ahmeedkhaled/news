import 'package:flutter/material.dart';
import 'package:news/api_manager.dart';
import 'package:news/category/category_details_view_model.dart';
import 'package:news/modal/SourcesRespon.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/modal/category.dart';
import 'package:news/providers/language.dart';
import 'package:news/tabs/tabs.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  Category category;
  CategoryDetails({required this.category});
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();
 late AppLanguage provider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSourceByCategory(widget.category.id, provider.appLanguage);
  }
  @override
  Widget build(BuildContext context) {
     provider = Provider.of<AppLanguage>(context);
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<CategoryDetailsViewModel>(
        builder: (context, viewModal, child) {
          if (viewModel.errorMessage != null) {
            return Column(
              children: [
                Text(viewModal.errorMessage!),
                ElevatedButton(
                    onPressed: () {
                      viewModal.getSourceByCategory(
                          widget.category.id, provider.appLanguage);
                      setState(() {});
                    },
                    child: Text(AppLocalizations.of(context)!.try_again))
              ],
            );
          } else if (viewModel.sourceList == null) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          } else {
            return TabContainer(sourceList: viewModel.sourceList!);
          }
        },
      ),
    );
    // FutureBuilder<SourcesRespon>(
    //   future: ApiManager.getSource(widget.category.id,provider.appLanguage),
    //   builder:(context, snapshot){
    //     if(snapshot.connectionState==ConnectionState.waiting){
    //       return Center(child: CircularProgressIndicator(
    //         color: Theme.of(context).primaryColor,
    //       ),);
    //     }else if(snapshot.hasError){
    //       return Column(
    //         children: [
    //           Text(AppLocalizations.of(context)!.something_went_wrong),
    //           ElevatedButton(onPressed: (){
    //             ApiManager.getSource(widget.category.id,provider.appLanguage);
    //             setState(() {});
    //           }, child: Text(AppLocalizations.of(context)!.try_again))
    //         ],
    //       );
    //     }
    //     if(snapshot.data?.status !='ok'){
    //       return Column(
    //         children: [
    //           Text(snapshot.data?.message??""),
    //           ElevatedButton(onPressed: (){
    //             ApiManager.getSource(widget.category.id,provider.appLanguage);
    //             setState(() {});
    //           }, child: Text(AppLocalizations.of(context)!.try_again))
    //         ],
    //       );
    //     }
    //     var sourceList=snapshot.data?.sources??[];
    //     return TabContainer(sourceList: sourceList);
    //
    //
    //   },
    // );
  }
}
