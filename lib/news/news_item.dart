import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/modal/NewsResponse.dart';
import 'package:news/my_theme.dart';

class NewsItem extends StatelessWidget {
  News news;
  NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? "",
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.3,
              fit: BoxFit.fill,
              placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              )),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Text(
            news.author ?? "",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.grey),
          ),
          SizedBox(height: 10,),
          Text(news.title ?? "", style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: MyTheme.blackColor
          )),
          SizedBox(height: 10,),
          Text(
            news.publishedAt ?? "",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.grey),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
