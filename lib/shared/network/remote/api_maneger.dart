import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/models/SourcesResponse.dart';
import 'package:news/models/NewsData.dart';
class ApiManager{
  static String Base_Url='newsapi.org';
   static String Api_key='e15961797e3a4536a10ca4b2842a96ca';

  static Future<SourcesResponse>getSources( String categoryId)async{
    Uri url=Uri.https(Base_Url,'/v2/top-headlines/sources',{
      'apiKey':Api_key,
      'category':categoryId
    });
   http.Response response = await http.get(url);
   var jason=jsonDecode(response.body);
   //print(jason);
  return SourcesResponse.fromJson(jason);
  }


  static Future<NewsData>getNewsData({String? sourceId,String? search_key_word })async{
    Uri url=Uri.https(Base_Url,'/v2/everything',{
      'apiKey':Api_key,
      'sources':sourceId,
      'q':search_key_word,
    });
    http.Response response = await http.get(url);
    var jason=jsonDecode(response.body);

    return NewsData.fromJson(jason);

  }

}