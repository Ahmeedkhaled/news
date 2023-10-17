
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/category/category_item.dart';
import 'package:news/modal/category.dart';

class CategoryFragments extends StatelessWidget {
  var categoryList=Category.getCategories();
  Function onCategoryClick;
  CategoryFragments({required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Text(
                AppLocalizations.of(context)!.pick_your_category_of_interest,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.start,
              ),
          SizedBox(height: 20,),

          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 18, mainAxisSpacing: 18),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    onCategoryClick(categoryList[index]);
                  },
                    child: CategoryItem(category: categoryList[index], index: index),
                );
              },
              itemCount:categoryList.length ,
            ),
          )
        ],
      ),
    );
  }
}
