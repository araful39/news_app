

import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/model/news_model.dart';

class ApiService{
final all_news_url="https://newsapi.org/v2/everything?q=bitcoin&apiKey=a889a459e4af41f68f0f3bfa56527144";
final breaking_news_url=" https://newsapi.org/v2/top-headlines?country=us&apiKey=a889a459e4af41f68f0f3bfa56527144";

Future<List<Articles>> getAllNews()async{
  try{

    Response response=await get(Uri.parse(all_news_url));
    if(response.statusCode==200){

      Map<String,dynamic> json=jsonDecode(response.body);
      List<dynamic> body=json["articles"];
      List<Articles> articlesList=body.map((item) => Articles.fromJson(item)).toList();
      print(articlesList);
      return articlesList;
    }else{
      throw ("No news found");
    }

  }
  catch(e){
    print(e.toString());
    throw e;
  }
}
Future<List<Articles>> getBreakingNews()async{
  try{

    Response response=await get(Uri.parse(all_news_url));
    if(response.statusCode==200){

      Map<String,dynamic> json=jsonDecode(response.body);
      List<dynamic> body=json["articles"];
      List<Articles> articlesList=body.map((item) => Articles.fromJson(item)).toList();
      return articlesList;
    }else{
      throw ("No news found");
    }

  }
  catch(e){
    print(e.toString());
    throw e;
  }
}

}