import 'package:flutter/material.dart';
import 'package:news/screens/home_tabs/favourite.dart';
import 'package:news/shared_ui/navigation_drawer.dart';

import 'home_tabs/popular.dart';

class HeadLIneNews extends StatefulWidget {
  const HeadLIneNews({Key? key}) : super(key: key);

  @override
  _HeadLIneNewsState createState() => _HeadLIneNewsState();
}

class _HeadLIneNewsState extends State<HeadLIneNews>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: false,
        title: Text('Headline News'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              text: "WHAT'S NEW",
            ),
            Tab(
              text: "POPULAR",
            ),
            Tab(
              text: "FAVOURITES",
            ),
          ],
        ),
      ),
      drawer: NavigationDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: [
          Favourite(),
          Popular(),
          Favourite(),
        ],
      ),
    );
  }
}
