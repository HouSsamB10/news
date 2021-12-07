import 'dart:math';

import 'package:flutter/material.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, position) {
          return Card(
            child: Container(
              padding: EdgeInsets.all(14),
              child: Column(
                children: [
                  _autherRow(),
                  SizedBox(height: 16),
                  _newsItemRow(),
                ],
              ),
            ),
          );
        });
  }

  Widget _autherRow() {
    List<Color> colorList = [
      Colors.red,
      Colors.teal,
      Colors.deepOrange,
      Colors.indigo,
      Colors.brown,
      Colors.purple,
    ];

    Random random = Random();

    Color _getRandomColor() {
      return colorList[random.nextInt(colorList.length)];
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/houssam.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mickel adems ',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      '15 min .',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'life style',
                      style: TextStyle(
                        color: _getRandomColor(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.bookmark_border,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _newsItemRow() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 14),
          width: 125,
          height: 125,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/images/bg0.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                'Tech Tent : Old phones and safe social',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
              ),
              Text(
                'Tech Tent : Old phones and safe socialm,ankfnaknlafd .',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  height: 1.25,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
