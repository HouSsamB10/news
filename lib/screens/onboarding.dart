import 'package:flutter/material.dart';
import 'package:news/screens/home_screen.dart';
import 'package:page_view_indicators/page_view_indicators.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _currentIndex = 0;
  ValueNotifier<int> _pageViewNotifier = ValueNotifier(0);

  List<PageModel> pages = [
    PageModel('Welcome',
        'Making friends is easy as waving your hand back and forth in easy step'),
    PageModel('Immigration Canada',
        'Making friends is easy as waving your hand back and forth in easy step'),
    PageModel('News',
        'Making friends is easy as waving your hand back and forth in easy step'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: pages.length,
            itemBuilder: (BuildContext context, index) {
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage('assets/images/bg0.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      /*    Transform.translate(
                        offset: Offset(0, -100),
                        child: Icon(
                          Icons.ac_unit,
                          size: 150,
                          color: Colors.white,
                        ),
                      ),*/
                      Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: Text(
                          pages[index]._Title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white.withOpacity(0.9),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 30,
                          right: 30,
                        ),
                        child: Text(
                          pages[index]._description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey.shade100.withOpacity(0.8),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(10, -120),
                        child: Align(
                          alignment: Alignment.center,
                          child: _buildCircleIndicator(),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            onPageChanged: (index) {
              _pageViewNotifier.value = index;
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.08,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange[700],
                  ),
                  child: Text(
                    'GET STARTED',
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 1,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    _updateSeen();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HomeScreen();
                    }));
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _updateSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('seen', true);
  }

  _buildCircleIndicator() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CirclePageIndicator(
          itemCount: pages.length,
          currentPageNotifier: _pageViewNotifier,
        ),
      ),
    );
  }

  List<Widget> _drawPageIndicators() {
    List<Widget> _widgets = [];
    for (var i = 0; i < pages.length; i++) {
      _widgets.add(_drawCircle(_currentIndex == i ? Colors.red : Colors.white));
    }
    return _widgets;
  }

  Widget _drawCircle(Color color) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}

class PageModel {
  String _Title;
  String _description;

  PageModel(this._Title, this._description);
}
