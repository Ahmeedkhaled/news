import 'package:flutter/material.dart';
import 'package:news/api_manager.dart';
import 'package:news/modal/SourcesRespon.dart';

class CategoryDetailsViewModel extends ChangeNotifier{
  List<Source>? sourceList;
  String? errorMessage;
  void getSourceByCategory(String categoryId,String language)async{
    sourceList=null;
    errorMessage=null;
    notifyListeners();
    try{
      var respone=await ApiManager.getSource(categoryId, language);
      if(respone.status=='error'){
        errorMessage=respone.message;
      }else{
        sourceList=respone.sources;
      }

    }catch(e){
      errorMessage="Error loading source list";
    }
    notifyListeners();

}
}