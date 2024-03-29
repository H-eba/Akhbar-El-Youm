import 'package:flutter/material.dart';
import 'package:news/layoute/home.dart';
import 'package:news/screens/news_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     initialRoute: HomeScreen.routeName,
      routes:{

       HomeScreen.routeName:(context)=>HomeScreen(),
       NewsDetails.routeName:(context)=>NewsDetails(),
      },
    );
  }
}

