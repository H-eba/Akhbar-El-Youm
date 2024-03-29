import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news/models/category_models.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/NewsData.dart';

class NewsDetails extends StatelessWidget {
  static String routeName = 'news details screen';
  //CategoryModels categoryModel;
NewsDetails();

  @override
  Widget build(BuildContext context) {
    var artical=ModalRoute.of(context)!.settings.arguments as Articles ;
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage('assets/images/pattern.png'))),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: Text('News Title',
                style: TextStyle(color: Colors.white,fontSize: 25),),
              centerTitle: true,

              shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  )),
            ),
            body:Container
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

         // Text(artical.publishedAt??'',style: TextStyle(fontSize: 20),),
          SizedBox(height: 20,),
          Text(
            artical.description??'',style: TextStyle(fontSize: 20,
          color: Colors.grey),),
          SizedBox(height: 15,),
          InkWell(
            onTap: (){
          launchUrl(Uri.parse(artical.url??''));
            },
            child: Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
              Text('view all artical',style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.w500),),
              Icon(Icons.arrow_forward_ios_rounded)
            ],),
          )
        ],),
    ),
        )
    );
  }
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

}
