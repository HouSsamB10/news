import 'package:flutter/material.dart';
import 'package:news/shared_ui/navigation_drawer.dart';

class InstagramFeed extends StatefulWidget {
  const InstagramFeed({Key? key}) : super(key: key);

  @override
  _InstagramFeedState createState() => _InstagramFeedState();
}

class _InstagramFeedState extends State<InstagramFeed> {
  TextStyle _hashTagStyle = TextStyle(
    color: Colors.orange,
  );

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _cardHeader(),
                  _drawTitle(),
                  _drawHashTags(),
                  _drawBody(),
                  _drawFooter(),
                ],
              ),
            );
          }),
    );
  }

  Widget _cardHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
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
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                color: Colors.grey,
              ),
            ),
            Transform.translate(
              offset: Offset(-12, 0),
              child: Text(
                '25',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _drawTitle() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2, left: 16, right: 16),
      child: Text('We also talk about the future of work as the robots'),
    );
  }

  Widget _drawHashTags() {
    return Container(
      child: Wrap(
        children: [
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.blue,
            ),
            onPressed: () {},
            child: Text(
              '#advance',
              style: _hashTagStyle,
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.blue,
            ),
            onPressed: () {},
            child: Text(
              '#advance',
              style: _hashTagStyle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawBody() {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Image(
        image: ExactAssetImage('assets/images/bg5.jpg'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _drawFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            primary: Colors.blue,
          ),
          onPressed: () {},
          child: Text(
            '10 COMMENTS',
            style: _hashTagStyle,
          ),
        ),
        Row(
          children: [
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.blue,
              ),
              onPressed: () {},
              child: Text(
                'SHARE',
                style: _hashTagStyle,
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.blue,
              ),
              onPressed: () {},
              child: Text(
                'OPEN',
                style: _hashTagStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
