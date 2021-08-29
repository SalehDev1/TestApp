import 'package:flutter/material.dart';

class Airports extends StatelessWidget {
  Airports({
    Key? key,
    this.airport,
    this.lon,
    this.dxb,
    this.fromtime,
    this.totime,
    this.price,
    this.remains,
    this.bussclass,
    this.timetor,
    this.imgeairport,
  }) : super(key: key);

  final String? airport;
  final String? lon;
  final String? dxb;
  final String? fromtime;
  final String? totime;
  final String? price;
  final String? remains;
  final String? bussclass;
  final String? timetor;
  final String? imgeairport;
  // ignore: non_constant_identifier_names

  Widget build(BuildContext context) {
    return Container(
      child: Card(
          child: Container(
        margin: EdgeInsets.only(bottom: 10, left: 32, top: 5, right: 32),
        padding: EdgeInsets.all(5),
        child: Row(children: [
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(this.airport! + ' Airport',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))
                      ]),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(child: Text(this.lon!)),
                      Expanded(child: Text(this.dxb!)),
                    ],
                  ),
                  Row(children: [
                    SizedBox(
                      width: 60,
                    ),
                    Image(width: 50, image: AssetImage('images/im8.png')),
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(child: Text(this.fromtime!)),
                      Expanded(child: Text(this.totime!)),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Text(this.price!,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold))),
                      Expanded(
                          child: Text(this.remains!,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold))),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: 20.0,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.pink[50]!),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(
                                            color: Colors.pink[50]!,
                                            width: 2.0)))),
                            child: Text(this.bussclass!,
                                style:
                                    TextStyle(color: Colors.red, fontSize: 13)),
                            onPressed: () {},
                          )),
                      Expanded(
                          child: Text(this.timetor!,
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold))),
                    ],
                  )
                ],
              )),
          Container(
            height: 130,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                      width: 70, image: AssetImage('images/$imgeairport.png')),
                  SizedBox(
                    height: 20.0,
                    width: 65,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.pink[300]!),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(
                                          color: Colors.pink[300]!,
                                          width: 2.0)))),
                      child: Text('Book',
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                      onPressed: () {},
                    ),
                  ),
                ]),
          ),
        ]),
      )),
    );
  }
}
