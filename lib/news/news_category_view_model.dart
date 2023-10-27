import 'package:flutter/material.dart';
import 'package:news/api_manager.dart';
import 'package:news/modal/NewsResponse.dart';

class NewsCategoryViewModel extends ChangeNotifier{
  List<News>? newsList;
  String? errorMessage;

  void getNewsByCategory(String sourceId,String language)async{
    newsList=null;
    errorMessage=null;
    notifyListeners();
    try{
      var respone=await ApiManager.getNewsBySourceId(sourceId, language);
      if(respone.status !=null){
        errorMessage=respone.message;
      }else{
        newsList=respone.articles;
      }
    }catch(e){
      errorMessage="Error loading news list";
    }
    notifyListeners();
  }
}