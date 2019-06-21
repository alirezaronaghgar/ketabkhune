import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ketabkhune/pages/home_page.dart';
import 'package:ketabkhune/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main(){

  runApp(new MaterialApp(
    home: new MyApp(),
    routes: <String, WidgetBuilder>{
      '/login': (BuildContext context) => new Login_page(),
      '/home': (BuildContext context) => new HomePage(),
    },
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _login = false;




  @override
  void initState() {
    super.initState();
    _loadCounter();
    new Future.delayed(
        const Duration(seconds: 4),
            () {
              /*Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Login_page()),
        )*/
              if (_login)
               return Navigator.of(context).pushReplacementNamed('/home');
              else
                return  Navigator.of(context).pushReplacementNamed('/login');
            }

    );
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _login = (prefs.getBool('login')?? false);
    });

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: new Column(children: <Widget>[
          Divider(
            height: 160.0,
            color: Colors.white,
          ),
          new Image(image: new AssetImage("assets/book.png"),
            fit: BoxFit.cover,),
          new Text('توسعه ی علیرضا رونقگر',style: TextStyle(fontSize: 20),),
          Divider(
            height: 100.0,
            color: Colors.white,
          ),
        ]),
      ),
    );
  }
}
