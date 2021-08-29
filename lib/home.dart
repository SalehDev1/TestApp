import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:landon_airport/newshome.dart';
import 'package:landon_airport/airporthome.dart';
import 'package:landon_airport/style_app.dart';

import 'hotils.dart';

var _sharedValue;
// ignore: non_constant_identifier_names
get sharedValue => _sharedValue;
// ignore: non_constant_identifier_names
set sharedValue(var N) => _sharedValue = N;

var _index;
// ignore: non_constant_identifier_names
get Index => _index;
// ignore: non_constant_identifier_names
set Index(var N) => _index = N;

class CupertinoStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This app is designed only to work vertically, so we limit
    // orientations to portrait up and down.
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: const CupertinoThemeData(brightness: Brightness.light),
      home: AppHome(),
    );
  }
}

class AppHome extends StatefulWidget {
  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.white,
        leading: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on_rounded,
                color: Colors.red,
                size: 18,
              ),
              Container(
                child: Text('London Airport',
                    textAlign: TextAlign.end, style: TextStyle(fontSize: 13)),
              ),
            ],
          ),
        ),
        trailing: CircleAvatar(
            backgroundColor: Colors.red, child: Icon(Icons.person)),
      ),
      child: CupertinoSegmentedControlDemo(),
    );
  }
}

class CupertinoSegmentedControlDemo extends StatefulWidget {
  @override
  _CupertinoSegmentedControlDemoState createState() =>
      _CupertinoSegmentedControlDemoState();
}

class _CupertinoSegmentedControlDemoState
    extends State<CupertinoSegmentedControlDemo> {
  TextEditingController controller = new TextEditingController();

  // final TextEditingController controller = null;
  // final FocusNode focusNode = null;
  @override
  void initState() {
    super.initState();
    sharedValue = 0;
  }

  final Map<int, Widget> icons = <int, Widget>{
    0: Center(
      child: CupertinoStoreHomePage(),
    ),
    1: Center(
      child: AirportHome(),
    ),
    2: Center(
      child: Hotils(),
    ),
    3: Center(
      child: FlutterLogo(
        textColor: Colors.teal,
        size: 200.0,
      ),
    ),
    4: Center(
      child: FlutterLogo(
        textColor: Colors.cyan,
        size: 200.0,
      ),
    ),
  };

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),

        Row(
          children: [
            Expanded(
                flex: 4,
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Styles.searchBackground,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: CupertinoTextField(
                              placeholder: 'Search',
                              controller: controller,
                              style: Styles.searchText,
                              cursorColor: Styles.searchCursorColor,
                              decoration: null,
                            ),
                          ),
                          Icon(
                            CupertinoIcons.search,
                            color: Styles.searchIconColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
            Expanded(
              flex: 1,
              child: Transform.rotate(
                angle: 90 * pi / 180,
                child: Icon(
                  Icons.tune,
                  color: Styles.searchIconColor,
                ),
              ),
            ),
          ],
        ),

        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 31,
          child: CupertinoNavigationBar(
            border: null,
            middle: SizedBox(
              width: 500.0,
              child: CupertinoSegmentedControl<int>(
                selectedColor: Colors.white,
                unselectedColor: Colors.white,
                pressedColor: Colors.white,
                borderColor: Colors.white,
                children: <int, Widget>{
                  0: Text('Explore',
                      style: TextStyle(
                        color: (sharedValue == 0) ? Colors.red : Colors.black,
                      )),
                  1: Text('Flights',
                      style: TextStyle(
                        color: (sharedValue == 1) ? Colors.red : Colors.black,
                      )),
                  2: Text('Hotels',
                      style: TextStyle(
                        color: (sharedValue == 2) ? Colors.red : Colors.black,
                      )),
                  3: Text('Places',
                      style: TextStyle(
                        color: (sharedValue == 3) ? Colors.red : Colors.black,
                      )),
                  4: Text('Others',
                      style: TextStyle(
                        color: (sharedValue == 4) ? Colors.red : Colors.black,
                      )),
                },
                onValueChanged: (int newValue) {
                  setState(() {
                    sharedValue = newValue;
                  });
                },
                groupValue: sharedValue,
              ),
            ),
          ),
        ),

        /// and our third CupertinoNavigationBar
        /// Used just for the border and some padding
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: Container(
            child: icons[sharedValue],
          ),
        ),
      ],
    );
  }
}

class CupertinoStoreHomePage extends StatefulWidget {
  @override
  _CupertinoStoreHomePageState createState() => _CupertinoStoreHomePageState();
}

class _CupertinoStoreHomePageState extends State<CupertinoStoreHomePage> {
  @override
  void initState() {
    super.initState();
    Index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          onTap: (i) {
            setState(() {
              Index = i;
            });
          },
          backgroundColor: Colors.white,
          activeColor: Colors.red,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: CircleAvatar(
                  backgroundColor: (Index == 0) ? Colors.red : Colors.white,
                  child: Icon(
                    CupertinoIcons.house_fill,
                    color: (Index == 0) ? Colors.white : Colors.grey,
                  )),
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                  backgroundColor: (Index == 1) ? Colors.red : Colors.white,
                  child: Icon(
                    Icons.explore,
                    color: (Index == 1) ? Colors.white : Colors.grey,
                  )),
            ),
            BottomNavigationBarItem(
                icon: CircleAvatar(
                    backgroundColor: (Index == 2) ? Colors.red : Colors.white,
                    child: Image(
                        width: 27,
                        color: (Index == 2) ? Colors.white : Colors.grey,
                        image: AssetImage('images/im4.png')))),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                  backgroundColor: (Index == 3) ? Colors.red : Colors.white,
                  child: Image(
                      width: 27,
                      color: (Index == 3) ? Colors.white : Colors.grey,
                      image: AssetImage('images/im5.png'))),
            ),
          ],
        ),
        tabBuilder: (context, index) {
          CupertinoTabView? returnValue;
          //Index = index;
          switch (index) {
            case 0:
              returnValue = CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(
                  child: NewsHome(),
                );
              });
              break;
            case 1:
              returnValue = CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(
                  child: FlutterLogo(
                    textColor: Colors.teal,
                    size: 200.0,
                  ),
                );
              });
              break;
            case 2:
              returnValue = CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(
                  child: FlutterLogo(
                    textColor: Colors.teal,
                    size: 200.0,
                  ),
                );
              });
              break;
            case 3:
              returnValue = CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(
                  child: FlutterLogo(
                    textColor: Colors.teal,
                    size: 200.0,
                  ),
                );
              });
              break;
          }
          return returnValue!;
        },
      ),
    );
  }
}
