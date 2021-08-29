import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/airports.dart';

var _pass;
get Pass => _pass;
set Pass(var o) => _pass = o;

class AirportHome extends StatefulWidget {
  @override
  _ShoppingCartTabState createState() {
    return _ShoppingCartTabState();
  }
}

class _ShoppingCartTabState extends State<AirportHome> {
  final Stream<QuerySnapshot> _airportsStream =
      FirebaseFirestore.instance.collection('Airports').snapshots();
  @override
  void initState() {
    super.initState();
    Pass = 1;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
          margin: EdgeInsets.only(bottom: 10, left: 35, top: 5, right: 35),
          padding: EdgeInsets.all(5),
          // scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('From', style: TextStyle(fontSize: 14)),
                  Text('To', style: TextStyle(fontSize: 14))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('LON',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('DXB',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('London Airport', style: TextStyle(fontSize: 14)),
                  Text('Dubai Airport', style: TextStyle(fontSize: 14))
                ],
              ),
              Transform.rotate(
                  angle: 90 * pi / 180,
                  child: Icon(
                    Icons.flight,
                    color: Colors.red,
                    size: 35,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Date of departure', style: TextStyle(fontSize: 14)),
                  Text('Passengger', style: TextStyle(fontSize: 14))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Thu, 18 Oct 2021',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Material(
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                  Pass--;
                                });
                              },
                              child: Text('-',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)))),
                      SizedBox(
                        width: 10,
                      ),
                      Text(Pass.toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 10,
                      ),
                      Material(
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                  Pass++;
                                });
                              },
                              child: Text('+',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)))),
                    ],
                  )
                ],
              ),
              SizedBox(
                width: 320,
                // height: 20.0,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.pink[300]!),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                  color: Colors.pink[300]!, width: 2.0)))),
                  child: Text('Search Flight',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  onPressed: () {},
                ),
              )
            ],
          )),
      SizedBox(
        height: 10,
      ),
      airportslist(),
    ]);
  }

  Container airportslist() {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: _airportsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return Container(
                key: ObjectKey(data),
                color: Colors.grey[200],
                child: Airports(
                  airport: data['airport'],
                  lon: data['lon'],
                  dxb: data['dxb'],
                  fromtime: data['fromtime'],
                  totime: data['totime'],
                  price: data['price'],
                  remains: data['remains'],
                  bussclass: data['bussclass'],
                  timetor: data['timetor'],
                  imgeairport: data['imgeairport'],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
