import 'package:flutter/material.dart';
import 'package:news_app/ui/all_news.dart';
import 'package:news_app/ui/breaking_news.dart';

class MyHomePage extends StatefulWidget {
  final title;
  MyHomePage({super.key, this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: Text(widget.title,style: TextStyle(color: Colors.white),),
        bottom: TabBar(
          labelColor: Colors.white,
          labelStyle: TextStyle(color: Colors.black),
          tabs: [
            Tab(text: "Breaking News",),
            Tab(text: "All News ",)
          ],
        ),
      ),
          body: TabBarView(
            children: [
              BreakingNews(),
              AllNews(),
            ],
          ),
    ));
  }
}
