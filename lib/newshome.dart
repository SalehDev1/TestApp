import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:landon_airport/carousel.dart';

import 'model/news.dart';

class NewsHome extends StatefulWidget {
  @override
  _NewsHomeState createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
  final Stream<QuerySnapshot> _newsStream =
      FirebaseFirestore.instance.collection('News').snapshots();
  @override
  Widget build(BuildContext context) {
    //final products = model.getProducts();
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 3, left: 20),
          // scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Expanded(
                  flex: 3,
                  child: Text('Popular Destionation',
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 20))),
              Expanded(
                  child: Material(
                      child: InkWell(
                          onTap: () {},
                          child: Text('View all',
                              style:
                                  TextStyle(color: Colors.red, fontSize: 16)))))
            ],
          ),
        ),
        MyCarousels(),
        Container(
          margin: EdgeInsets.only(bottom: 3, left: 15),
          // scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Expanded(
                  flex: 3,
                  child: Text('Travel News',
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 20))),
              Expanded(
                child: Material(
                    child: InkWell(
                        onTap: () {},
                        child: Text('View all>',
                            style:
                                TextStyle(color: Colors.red, fontSize: 16)))),
              )
            ],
          ),
        ),
        mynews(),
      ],
    );
  }

  Container mynews() {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: _newsStream,
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
                child: News(
                  bodynews: data['bodynews'],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
