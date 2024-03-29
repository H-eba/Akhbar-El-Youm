import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/models/category_models.dart';
import 'package:news/widgets/category_item.dart';

class CategoriseTab extends StatelessWidget {
  Function onClick;
 CategoriseTab({required this.onClick ,super.key});

  @override
  Widget build(BuildContext context) {
    var categoryList = CategoryModels.gitCategoryModels();
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            'pick your category of interest',
            style: TextStyle(fontSize: 35),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  )
              ,itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    onClick(categoryList[index]);
                  },
                  child: CategoryItem(
                      model: categoryList[index],
                  index: index,),
                ) ;
              },
              itemCount: categoryList.length,
            ),
          )
        ],
      ),
    );
  }
}
