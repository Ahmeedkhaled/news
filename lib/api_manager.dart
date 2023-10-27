import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/api_constant.dart';
import 'package:news/modal/NewsResponse.dart';
import 'package:news/modal/SourcesRespon.dart';
import 'package:news/screen/pageination.dart';


class ApiManager{
  static Future<SourcesRespon> getSource(String categoryId,String language, )async{
    // https://newsapi.org/v2/top-headlines/sources?apiKey=ad9fa28f707047aa80c060b2707f0ae7
    Uri url=Uri.https(ApiConstant.baseUrl,ApiConstant.sourceUrl,{
      'apiKey':'ad9fa28f707047aa80c060b2707f0ae7',
      'category':categoryId,
      'language':language,
      'q':{
        'title',
        'description',
        'content'
      }
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



  static Future<NewsResponse> getNewsBySourceId(String sourceId ,String language)async {

    try{
      Uri url=Uri.https(ApiConstant.baseUrl,ApiConstant.NewsApi,{
        'apiKey':'ad9fa28f707047aa80c060b2707f0ae7',
        'sources': sourceId,
        'language':language,
        // 'page':_BeerListViewState
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