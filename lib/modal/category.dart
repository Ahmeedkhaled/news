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

  static List<Category> getCategories() {
    return[
    Category(
        id: 'sports',
        title: 'Sports',
        imageUrl: "assets/images/ball.png",
        color: Colors.red),
    Category(
        id: 'general',
        title: 'General',
        imageUrl: "assets/images/Politics.png",
        color: Color(0xff003E90)),
    Category(
        id: 'health',
        title: 'Health',
        imageUrl: "assets/images/health.png",
        color: Colors.pink),
    Category(
        id: 'business',
        title: 'Business',
        imageUrl: "assets/images/bussines.png",
        color: Colors.brown),
    Category(
        id: 'entertainment',
        title: 'Entertainment',
        imageUrl: "assets/images/environment.png",
        color: Colors.blue),
    Category(
        id: 'science',
        title: 'Science',
        imageUrl: "assets/images/science.png",
        color: Colors.yellow),
    ];

  }
}
