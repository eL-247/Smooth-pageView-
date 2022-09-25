import 'package:flutter/material.dart';

class CusttomPageView extends StatefulWidget {
  const CusttomPageView({Key? key}) : super(key: key);

  @override
  State<CusttomPageView> createState() => CusttomPageViewState();
}

class CusttomPageViewState extends State<CusttomPageView> {
  double _page = 0.0;
  final double _scaleFactor = 0.2;
  final PageController _pageController = PageController(
    viewportFraction: 0.8,
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      setState(() {
        _page = _pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[500],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 300,
            child: PageView.builder(
              controller: _pageController,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                double _scale;
                if (index == _page.floor() - 1 || index == _page.floor()) {
                  _scale = 1 - (_page - index) * _scaleFactor;
                } else if (index == _page.floor() + 1 ||
                    index == _page.floor() + 2) {
                  _scale = 1 - (index - _page) * _scaleFactor;
                } else {
                  _scale = 1;
                }
                return Transform.scale(
                  scaleY: _scale,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green[700],
                        borderRadius: BorderRadius.circular(40),
                      ),
                      alignment: const Alignment(0, 0),
                      child: Text('${index}'),
                    ),
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
