import 'package:flutter/material.dart';
import 'package:news/modal/SourcesRespon.dart';
import 'package:news/tabs/tab_item.dart';

class TabContainer extends StatefulWidget {
  List<Source> sourceList = [];

  TabContainer({required this.sourceList});

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourceList.length,
      child: TabBar(
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        indicatorColor: Colors.transparent,
        isScrollable: true,
        tabs: widget.sourceList
            .map((source) => TabItem(
                source: source,
                isSelected: selectedIndex == widget.sourceList.indexOf(source)))
            .toList(),
      ),
    );
  }
}
