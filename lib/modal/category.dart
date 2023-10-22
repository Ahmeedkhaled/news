import 'dart:ui';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class Category {
  String id;
  String title;
  String imageUrl;
  Color color;

  Category(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.color});

  static List<Category> getCategories(BuildContext context) {
    return[
    Category(
        id: 'sports',
        title: AppLocalizations.of(context)!.sports,
        imageUrl: "assets/images/ball.png",
        color: Colors.red),
    Category(
        id: 'general',
        title: AppLocalizations.of(context)!.general,
        imageUrl: "assets/images/Politics.png",
        color: Color(0xff003E90)),
    Category(
        id: 'health',
        title: AppLocalizations.of(context)!.health,
        imageUrl: "assets/images/health.png",
        color: Colors.pink),
    Category(
        id: 'business',
        title: AppLocalizations.of(context)!.business,
        imageUrl: "assets/images/bussines.png",
        color: Colors.brown),
    Category(
        id: 'entertainment',
        title: AppLocalizations.of(context)!.environment,
        imageUrl: "assets/images/environment.png",
        color: Colors.blue),
    Category(
        id: 'science',
        title: AppLocalizations.of(context)!.science,
        imageUrl: "assets/images/science.png",
        color: Colors.yellow),
    ];

  }
}
