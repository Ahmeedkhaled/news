import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api_constant.dart';
import 'package:news/modal/SourcesRespon.dart';

class ApiManager{
  static Future<SourcesRespon> getSource()async{

    // https://newsapi.org/v2/top-headlines/sources?apiKey=ad9fa28f707047aa80c060b2707f0ae7
    
    Uri url=Uri.https(ApiConstant.baseUrl,ApiConstant.sourceUrl,{
      'apiKey':'ad9fa28f707047aa80c060b2707f0ae7'
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
}