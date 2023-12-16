import 'package:flutter/material.dart';
import 'package:news_app/componet/news_item_list.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/service/api_service.dart';

class BreakingNews extends StatefulWidget {
  const BreakingNews({super.key});

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {
  ApiService apiService=ApiService();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: apiService.getBreakingNews(),
          builder: (context,snapshot){
            if(
            snapshot.hasData
            ){
              List<Articles> articleList=snapshot.data ?? [];
              return ListView.builder(
                itemCount: articleList.length,
                  itemBuilder: (context,index){
                  return NewsItemList(articleModel: articleList[index],);
                  });
            }
            else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          })
    );
  }
}
