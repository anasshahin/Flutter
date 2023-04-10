import 'package:flutter/material.dart';

import 'gird_view_widget_custom.dart';
import 'grid_view_widget_builder.dart';
import 'grid_view_widget_count.dart';
import 'grid_view_widget_extent.dart';

class GridViewWidgetAll extends StatefulWidget {
  const GridViewWidgetAll({Key? key}) : super(key: key);

  @override
  _GridViewWidgetAllState createState() => _GridViewWidgetAllState();
}

class _GridViewWidgetAllState extends State<GridViewWidgetAll> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                text: 'GridView.Count',
              ),
              Tab(
                text: 'GridView.builder',
              ),
              Tab(
                text: 'GridView.custom',
              ),
              Tab(
                text: 'GridView.extent',
              ),

            ],
          ),
          title: const Text('Tabs Demo'),
        ),
        body: const TabBarView(
          children: [
            GridViewWidgetCount(),
            GirdViewWidgetBuilder(),
            GridViewWidgetCustom(),
            GridViewWidgetExtent(),
          ],
        ),
      ),
    );
  }
}
