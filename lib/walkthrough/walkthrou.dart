import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

final _pageViewImage = [
  'assets/images/success.jpeg',
  'assets/images/success.jpeg',
  'assets/images/success.jpeg',
  'assets/images/success.jpeg',
];

class WalkThrough extends StatefulWidget {
  @override
  _WalkThroughState createState() => _WalkThroughState();
}

class _WalkThroughState extends State<WalkThrough> {
  ValueNotifier _valueNotifier = ValueNotifier<int>(0);
  PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(
      initialPage: _valueNotifier.value,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _pageViewHeight = MediaQuery.of(context).size.height * .65;
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            child: Container(
              child: PageView.builder(
                onPageChanged: (index) {
                  _valueNotifier.value = index;
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Container(
                        child: Image.asset(
                          _pageViewImage[index],
                          fit: BoxFit.cover,
                          height: _pageViewHeight,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 48, right: 48, top: 16, bottom: 16),
                        child: Text(
                          'Discover new places you will you love ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Color.fromRGBO(74, 74, 74, 1),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Discover new places you will you love , Discover new places you will you loveDiscover new places you will you loveDiscover new places you will you love ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color.fromRGBO(74, 74, 74, 1),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                itemCount: 4,
                pageSnapping: true,
                controller: _pageController,
              ),
            ),
          ),
          Container(
            child: Center(
              child: PageViewIndicator(
                indicatorPadding: EdgeInsets.all(3),
                pageIndexNotifier: _valueNotifier,
                length: _pageViewImage.length,
                normalBuilder: (animationController, index) => Circle(
                  size: 8.0,
                  color: Colors.grey,
                ),
                highlightedBuilder: (animationController, index) =>
                    ScaleTransition(
                  scale: CurvedAnimation(
                    parent: animationController,
                    curve: Curves.ease,
                  ),
                  child: Circle(
                    size: 11.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            height: 50,
          ),
        ],
      ),
    );
  }
}
