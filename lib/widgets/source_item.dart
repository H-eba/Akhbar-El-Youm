import 'package:flutter/material.dart';
import 'package:news/models/SourcesResponse.dart';

class SourceItem extends StatelessWidget {
  Sources sourse;
  bool selected;
  SourceItem({required this.sourse, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical:4,horizontal:16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
      border: Border.all(color: Colors.green),
      color:selected ? Colors.green : Colors.white ),
      child: Text(
        sourse.name ?? '',
        style: TextStyle(color: selected ? Colors.white : Colors.green),
      ),
    );
  }
}
