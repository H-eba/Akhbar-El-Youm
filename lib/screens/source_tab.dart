import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/screens/news_tab.dart';

import '../shared/network/remote/api_maneger.dart';

class SourceTab extends StatelessWidget {
  String categoryId;
 SourceTab({required this.categoryId,super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text('error');
        }
        var sourcesList = snapshot.data?.sources ?? [];
        return NewsTabs(sources: sourcesList);
      },
    );
  }
}
