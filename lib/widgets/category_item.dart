import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/models/category_models.dart';



class CategoryItem extends StatelessWidget {
  CategoryModels model;
  int index ;
   CategoryItem({ required this.model, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(10),
      decoration: BoxDecoration(color:model.color,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
        bottomRight:index.isEven?Radius.circular(25):Radius.circular(0),
        bottomLeft: index.isOdd?Radius.circular(25):Radius.circular(0),
      )),
      child:
      Column(children: [
        Expanded(child: Image.asset(model.image,)),
        Text(model.title,
        style: TextStyle(fontSize: 25,color: Colors.white),),
      ],) ,
    );
  }
}
