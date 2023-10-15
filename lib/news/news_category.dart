import 'package:flutter/material.dart';
import 'package:news/api_manager.dart';
import 'package:news/modal/NewsResponse.dart';
import 'package:news/modal/SourcesRespon.dart';
import 'package:news/news/news_item.dart';

class NewsCategory extends StatefulWidget {
  Source source;
  NewsCategory({required this.source});

  @override
  State<NewsCategory> createState() => _NewsCategoryState();
}

class _NewsCategoryState extends State<NewsCategory> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApiManager.getNewsBySourceId(widget.source.id??""),
        builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ),
          );
        }else if(snapshot.hasError){
          return Column(
            children: [
              Text("someThing went Error"),
              ElevatedButton(onPressed: (){
                ApiManager.getNewsBySourceId(widget.source.id??"");
                setState(() {

                });
              }, child: Text("Try Again")),
            ],
          );
        }

        if(snapshot.data?.status!="ok"){
          return Column(
            children: [
              Text(snapshot.data?.message??"someThing went Error"),
              ElevatedButton(onPressed: (){
                ApiManager.getNewsBySourceId(widget.source.id??"");
                setState(() {

                });
              }, child: Text("Try Again")),
            ],
          );
        }
        List newsList=snapshot.data?.articles??[];
        return ListView.builder(
          itemCount: newsList.length,
            itemBuilder: (context,index){
              return NewsItem(news: newsList[index]);

            }
        );
        },
    );
  }
}
