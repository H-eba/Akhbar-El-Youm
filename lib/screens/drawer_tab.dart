import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerTab extends StatelessWidget {
  Function onClick;
  static int categoryID=1;
  static int settingID=2;
   DrawerTab({required this.onClick,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width * .75,
      child: Column(
        children: [
          Container(
            height: 160,
            color: Colors.green,
            child: Center(
              child: Text(
                'News App',
                style: TextStyle(color: Colors.white, fontSize: 20,
                fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              onClick(categoryID);
            },
            child: Row(children: [
            
              Icon(Icons.category_outlined),
              SizedBox(width: 10,),
              Text('Category',style: TextStyle(fontSize: 20),),
            
            
            ],),
          ),
          SizedBox(height: 10,),
          InkWell(
            onTap: () {
              onClick(settingID);
            },
            child: Row(children: [

              Icon(Icons.settings),
              SizedBox(width: 10,),
              Text('Settings',style: TextStyle(fontSize: 20),),


            ],),
          )
        ],
      ),
    );
  }
}
