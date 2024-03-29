import 'package:flutter/material.dart';
import 'package:news/layoute/news_search.dart';
import 'package:news/models/category_models.dart';
import 'package:news/screens/categorise_tab.dart';
import 'package:news/screens/drawer_tab.dart';
import 'package:news/screens/source_tab.dart';
import 'package:news/shared/network/remote/api_maneger.dart';
import 'package:news/screens/news_tab.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'home screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image:
              DecorationImage(image: AssetImage('assets/images/pattern.png'))),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          drawer: DrawerTab(
            onClick: onDrawerClick,
          ),
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: NewsSearch());
                  },
                  icon: (Icon(
                    Icons.search,
                    color: Colors.white,
                  )))
            ],
            backgroundColor: Colors.green,
            title: Text(
              categoryModel == null ? 'news' : categoryModel!.title,
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            centerTitle: true,
            shape: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                )),
          ),
          body: categoryModel == null
              ? CategoriseTab(
                  onClick: onCategoryClick,
                )
              : SourceTab(categoryId: categoryModel!.id)),
    );
  }

  CategoryModels? categoryModel;

  onCategoryClick(catModel) {
    categoryModel = catModel;
    setState(() {});
  }

  onDrawerClick(value) {
    if (value == DrawerTab.categoryID) {
      categoryModel = null;
      Navigator.pop(context);
      setState(() {});
    } else if (value == DrawerTab.settingID) {}
  }
}
