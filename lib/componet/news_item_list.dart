
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';

class NewsItemList extends StatelessWidget {
  final Articles articleModel;
  const NewsItemList({super.key, required this.articleModel});

  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: CachedNetworkImage(
              fit: BoxFit.fitWidth,
              width: double.infinity,
              height: w/2,
              imageUrl:articleModel.urlToImage.toString(),
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(articleModel.publishedAt.toString())),
              SizedBox(
                width: 15,
              ),
              Expanded(child: Text(articleModel.title.toString())),
            ],
          ),

        ],
    ),),
      );
  }
}
