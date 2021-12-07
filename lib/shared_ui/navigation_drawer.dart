import 'package:flutter/material.dart';
import 'package:news/models/nav_menu.dart';
import 'package:news/screens/facebook_feed.dart';
import 'package:news/screens/headline_news.dart';
import 'package:news/screens/home_screen.dart';
import 'package:news/screens/insta_feed.dart';
import 'package:news/screens/twitter_feed.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  List<NavMenuItem> navigationMenu = [
    NavMenuItem(title: 'Explore', destination: () => HomeScreen()),
    NavMenuItem(title: 'headline', destination: () => HeadLIneNews()),
    NavMenuItem(title: 'Twitter Feed', destination: () => TwitterFeed()),
    NavMenuItem(title: 'Instagram feed', destination: () => InstagramFeed()),
    NavMenuItem(title: 'Facebook feed', destination: () => FacebookFeed()),
    /* NavMenuItem('Settings', destination),
    NavMenuItem('logout', destination),*/
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/images/bg5.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: navigationMenu.length,
              itemBuilder: (context, position) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      navigationMenu[position].title,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Colors.grey.shade400,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      //
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              navigationMenu[position].destination(),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
