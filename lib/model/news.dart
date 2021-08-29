import 'package:flutter/material.dart';

class News extends StatelessWidget {
  News({
    Key? key,
    this.bodynews,
  }) : super(key: key);

  final String? bodynews;

  // ignore: non_constant_identifier_names

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(children: [
        Expanded(flex: 4, child: Text(this.bodynews!)),
        Container(
          height: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 65.0,
                height: 20.0,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.pink[100]!),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                  color: Colors.pink[100]!, width: 2.0)))),
                  child: Text('News',
                      style: TextStyle(color: Colors.red, fontSize: 12)),
                  onPressed: () {},
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.black,
                size: 20,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
