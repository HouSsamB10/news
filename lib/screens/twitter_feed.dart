import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news/shared_ui/navigation_drawer.dart';

class TwitterFeed extends StatefulWidget {
  const TwitterFeed({Key? key}) : super(key: key);

  @override
  _TwitterFeedState createState() => _TwitterFeedState();
}

class _TwitterFeedState extends State<TwitterFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
        centerTitle: false,
        title: Text('Twitter Feed'),
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, position) {
            return Card(
              child: Column(
                children: [
                  _cardHeader(),
                  _cardBody(),
                  _drawLine(),
                  _cardFooter(),
                ],
              ),
            );
          }),
    );
  }

  Widget _cardHeader() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: CircleAvatar(
            backgroundImage: ExactAssetImage('assets/images/houssam.jpg'),
            radius: 24,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Hou Ssam',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 4),
                Text(
                  '@ch_iro',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Fri,12 May 2017 * 14.30',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  Widget _cardBody() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: Text(
        'We also talk about the future of work as the robots advence , and we talk about the future tech .',
        style: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 16,
          height: 1.1,
        ),
      ),
    );
  }

  Widget _cardFooter() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.repeat,
                  color: Colors.orange,
                  size: 20,
                ),
              ),
              Text(
                '25',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Row(
            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.blue,
                ),
                onPressed: () {},
                child: Text(
                  'SHARE',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 12,
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.blue,
                ),
                onPressed: () {},
                child: Text(
                  'OPEN',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 12,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _drawLine() {
    return Container(
      height: 1,
      color: Colors.grey.shade200,
      margin: EdgeInsets.only(top: 10),
    );
  }
}
