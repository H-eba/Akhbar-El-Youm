import 'package:flutter/material.dart';
import 'package:news/shared/network/remote/api_maneger.dart';
import 'package:news/widgets/news_data_item.dart';
import 'package:news/widgets/source_item.dart';

import '../models/SourcesResponse.dart';

class NewsTabs extends StatefulWidget {
  List<Sources> sources;
  NewsTabs({required this.sources});

  @override
  State<NewsTabs> createState() => _NewsTabsState();
}

class _NewsTabsState extends State<NewsTabs> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
                isScrollable: true,
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                onTap: (value) {
                  selectedIndex = value;
                  setState(() {});
                },
                tabs: widget.sources
                    .map((e) => Tab(
                          child: SourceItem(
                              sourse: e,
                              selected:
                                  widget.sources.elementAt(selectedIndex) == e),
                        ))
                    .toList())),
        FutureBuilder(
          future:
              ApiManager.getNewsData(sourceId:widget.sources[selectedIndex].id ?? '' ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text('error');
            }
            var articals = snapshot.data?.articles ?? [];
            return Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
                itemBuilder: (context, index) {
                  return NewsDataItem(artical: articals[index]);
                },
                itemCount: articals.length,
              ),
            );
          },
        ),
      ],
    );
  }
}
