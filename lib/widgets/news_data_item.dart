
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news/screens/news_details.dart';

import '../models/NewsData.dart';

class NewsDataItem extends StatelessWidget {
  Articles artical;
 NewsDataItem({required this.artical,super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, NewsDetails.routeName,arguments: artical);
      },
      child: Container
        (padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20,),color: Colors.grey.shade100),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          ClipRRect(borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                height: 250,
                imageUrl: artical.urlToImage??'',
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
          ),
          Text(artical.source?.name??'',style: TextStyle(
              color:Colors.grey,fontSize: 20,fontWeight: FontWeight.w500),),
          Text(maxLines: 2,
            overflow: TextOverflow.ellipsis,
            artical.title??'',style: TextStyle(fontSize: 20),),
        ],),
      ),
    );
  }
}
