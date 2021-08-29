// ignore: import_of_legacy_library_into_null_safe

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Map<int, String> nameimages = {
  0: 'Western North American Highway',
  1: 'Central Road England',
  2: 'London Eye',
  3: 'National Museum London',
};

class MyCarousels extends StatefulWidget {
  @override
  _mycarouselsState createState() => _mycarouselsState();
}

class _mycarouselsState extends State<MyCarousels> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
              height: 225,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
          items: imageSliders(4),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                4,
                (i) => GestureDetector(
                      onTap: () => _controller.animateToPage(i),
                      child: Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                (Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white
                                        : Colors.red)
                                    .withOpacity(_current == i ? 0.9 : 0.3)),
                      ),
                    ))),
      ],
    ));
  }
}

List<Container> imageSliders(int count) => List.generate(
    count,
    (i) => Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              child: Stack(
                children: <Widget>[
                  Image.asset('images/im$i.jpg', fit: BoxFit.fitHeight),
                  Positioned(
                    bottom: 25.0,
                    left: 10.0,
                    child: Container(
                      width: 300,
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                      child: Text(
                        nameimages[i]!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30.0,
                    right: 50.0,
                    child: Container(
                      child: SizedBox(
                        height: 24.0,
                        width: 100,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.deepPurple[50]!),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(
                                          color: Colors.deepPurple[50]!,
                                          width: 2.0)))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.explore,
                                size: 18,
                                color: Colors.red,
                              ),
                              Text('Atlas',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 12)),
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ));
