import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.lightGreen,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

      Container(
        margin: const EdgeInsets.only(left: 80.0,top: 60.0),
        height: 200,
              width: 200,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: new AssetImage("assets/ax.jpg"))),
            ),
            Container(
              margin: const EdgeInsets.only(left: 80.0,top: 60.0),
              child: new Text('کاری از علیرضا رونقگر',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.teal),),
            ),
            Container(
              margin: const EdgeInsets.only(left: 80.0,top: 60.0),
              child: new Text('Email:alirezaronaghgar@mailfa.com',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.teal),),
            ),
          ],
        ));
  }
}
