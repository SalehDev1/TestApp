import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Map<int, String> hotelsname = {
  0: 'Lakeside Park Villa',
  1: 'Luxury Villa with Mountain View',
  2: 'Seaside Holiday Villa',
  3: 'Hilton Premium Hotel',
};
Map<int, String> hotelsprice = {
  0: 'Rp360,000/night',
  1: 'Rp320,000/night',
  2: 'Rp600,000/night',
  3: 'RpBBB,000/night',
};

class Hotils extends StatefulWidget {
  @override
  _ShoppingCartTabState createState() {
    return _ShoppingCartTabState();
  }
}

class _ShoppingCartTabState extends State<Hotils> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 20, right: 10),
          // scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Expanded(
                  flex: 3,
                  child: Text('Hotel leisure',
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
                                  TextStyle(color: Colors.red, fontSize: 16)))))
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(child: _buildGrid()),
      ],
    );
  }

  Widget _buildGrid() => GridView.extent(
      maxCrossAxisExtent: 250,
      padding: EdgeInsets.all(10),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: _buildGridTileList(4));

  List<Container> _buildGridTileList(int count) => List.generate(
      count,
      (id) => Container(
          constraints: BoxConstraints.expand(
            height: 200.0,
          ),
          padding: EdgeInsets.only(left: 16.0, bottom: 8.0, right: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: AssetImage('images/$id-0.jpg'), fit: BoxFit.fitHeight),
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 20.0,
                right: 1.0,
                child: Container(
                  child: SizedBox(
                    height: 24.0,
                    width: 110,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.deepPurple[50]!),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(
                                          color: Colors.deepPurple[50]!,
                                          width: 2.0)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            (id == 0)
                                ? Icons.description
                                : Icons.description_outlined,
                            size: 18,
                            color: Colors.red,
                          ),
                          Text('Excellent',
                              style:
                                  TextStyle(color: Colors.red, fontSize: 12)),
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0.0,
                bottom: 0.0,
                child: Container(
                  width: 145,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(hotelsname[id]!,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          )),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.amber,
                          );
                        }),
                      ),
                      Container(
                        // width: 148,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(hotelsprice[id]!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                )),
                            SizedBox(
                              height: 20.0,
                              width: 60,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            side: BorderSide(
                                                color: Colors.white,
                                                width: 2.0)))),
                                child: Text('Book',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12)),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
          // child: Image.asset('images/$id-0.jpg'),
          ));
}
