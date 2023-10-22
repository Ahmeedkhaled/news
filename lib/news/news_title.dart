import 'dart:core';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:news/modal/NewsResponse.dart';
import 'package:news/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsTitle extends StatefulWidget {
  static const String routeName = "news_title";
  late NewsArgs news;
  @override
  State<NewsTitle> createState() => _NewsTitleState();
}

class _NewsTitleState extends State<NewsTitle> {
  @override
  Widget build(BuildContext context) {
     widget.news = ModalRoute
        .of(context)!
        .settings
        .arguments as NewsArgs;
    return Stack(
      children: [
        Container(
            color: MyTheme.whiteColor,
            child: Image.asset(
              "assets/images/pattern.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            )),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              widget.news.title ?? "",
              style: Theme
                  .of(context)
                  .textTheme
                  .titleSmall,
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: CachedNetworkImage(
                    imageUrl: widget.news.urlToImage ?? "",
                    width: double.infinity,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.3,
                    fit: BoxFit.fill,
                    placeholder: (context, url) =>
                        Center(
                            child: CircularProgressIndicator(
                              color: Theme
                                  .of(context)
                                  .primaryColor,
                            )),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(widget.news.title ?? "",
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(
                        color: MyTheme.blackColor,
                        fontWeight: FontWeight.w600)),
                SizedBox(
                  height: 20,
                ),
                Text(widget.news.description ?? "",
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontSize: 20, fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    _launchURL();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.view_full_article,
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                          fontSize: 15,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 15,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _launchURL() async {
    final Uri url = Uri.parse(widget.news.url??"");
    if (!await launchUrl(url)) {
      throw Exception('Could not launch ${widget.news.url??""}');
    }
  }
}
class NewsArgs extends News {
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? id;

  NewsArgs(
      {required this.title,
      required this.urlToImage,
      required this.description,
      required this.id,
      required this.url});
}
// Row(
// mainAxisAlignment: MainAxisAlignment.end,
// children: [
// RichText(
// text: TextSpan(
// children: [
// TextSpan(
// text:
// AppLocalizations.of(context)!.view_full_article,
// style: Theme.of(context)
//     .textTheme
//     .titleMedium!
//     .copyWith(
// fontSize: 15,
// ),
// ),
// TextSpan(
// recognizer: TapGestureRecognizer()
// ..onTap = () {
// launchUrl(Uri.parse(news.url ?? ""));
// },
// ),
// ],
// ),
// ),
// Icon(
// Icons.arrow_forward,
// size: 15,
// )
// ],
// ),
