import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/api_constant.dart';
import 'package:news/modal/NewsResponse.dart';
import 'package:news/modal/SourcesRespon.dart';

class ApiManager{
  static Future<SourcesRespon> getSource(String categoryId)async{

    // https://newsapi.org/v2/top-headlines/sources?apiKey=ad9fa28f707047aa80c060b2707f0ae7
    
    Uri url=Uri.https(ApiConstant.baseUrl,ApiConstant.sourceUrl,{
      'apiKey':'ad9fa28f707047aa80c060b2707f0ae7',
      'category':categoryId
    });
    try{
      var respone=await http.get(url);
      var bodyString=respone.body;
      var json=jsonDecode(bodyString);
      return SourcesRespon.fromJson(json);
    }catch(e){
      throw e;
    }
  }



  static Future<NewsResponse> getNewsBySourceId(String sourceId)async {
    try{
      Uri url=Uri.https(ApiConstant.baseUrl,ApiConstant.NewsApi,{
        'apiKey':'ad9fa28f707047aa80c060b2707f0ae7',
        'sources': sourceId,
      });
      var response= await http.get(url);
      var bodyString= response.body;
      var json= jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    }catch(e){
      throw e;
    }

  }
}