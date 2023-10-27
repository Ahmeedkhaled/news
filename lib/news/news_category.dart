import 'package:flutter/material.dart';
import 'package:news/api_manager.dart';
import 'package:news/modal/NewsResponse.dart';
import 'package:news/modal/SourcesRespon.dart';
import 'package:news/news/news_category_view_model.dart';
import 'package:news/news/news_item.dart';
import 'package:news/news/news_details.dart';
import 'package:news/providers/language.dart';
import 'package:provider/provider.dart';

class NewsCategory extends StatefulWidget {
  Source source;
  NewsCategory({required this.source});

  @override
  State<NewsCategory> createState() => _NewsCategoryState();
}

class _NewsCategoryState extends State<NewsCategory> {
  NewsCategoryViewModel viewModel = NewsCategoryViewModel();
  late AppLanguage provider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsByCategory(widget.source.id ?? "", provider.appLanguage);
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppLanguage>(context);
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<NewsCategoryViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.errorMessage != null) {
            return Column(
              children: [
                Text(viewModel.errorMessage!),
                ElevatedButton(
                    onPressed: () {
                      viewModel.getNewsByCategory(
                          widget.source.id ?? "", provider.appLanguage);
                      setState(() {});
                    },
                    child: Text("Try Again")),
              ],
            );
          } else if (viewModel.newsList == null) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          } else {
            return ListView.builder(
                itemCount: viewModel.newsList!.length,
                itemBuilder: (context, index) {
                  return NewsItem(news: viewModel.newsList![index]);
                });
          }
        },
      ),
    );
    //   FutureBuilder<NewsResponse>(
    //   future: ApiManager.getNewsBySourceId(
    //       widget.source.id ?? "", provider.appLanguage),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(
    //         child: CircularProgressIndicator(
    //           color: Theme.of(context).primaryColor,
    //         ),
    //       );
    //     } else if (snapshot.hasError) {
    //       return Column(
    //         children: [
    //           Text("someThing went Error"),
    //           ElevatedButton(
    //               onPressed: () {
    //                 ApiManager.getNewsBySourceId(
    //                     widget.source.id ?? "", provider.appLanguage);
    //                 setState(() {});
    //               },
    //               child: Text("Try Again")),
    //         ],
    //       );
    //     }
    //
    //     if (snapshot.data?.status != "ok") {
    //       return Column(
    //         children: [
    //           Text(snapshot.data?.message ?? "someThing went Error"),
    //           ElevatedButton(
    //               onPressed: () {
    //                 ApiManager.getNewsBySourceId(
    //                     widget.source.id ?? "", provider.appLanguage);
    //                 setState(() {});
    //               },
    //               child: Text("Try Again")),
    //         ],
    //       );
    //     }
    //     List newsList = snapshot.data?.articles ?? [];
    //     return ListView.builder(
    //         itemCount: newsList.length,
    //         itemBuilder: (context, index) {
    //           return NewsItem(news: newsList[index]);
    //         });
    //   },
    // );
  }
}
