import 'package:flutter/material.dart';
import 'package:ketabkhune/pages/about_page.dart';
import 'package:ketabkhune/pages/home_page.dart';
import 'package:ketabkhune/pages/signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login_page extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignupPage(),
        '/home': (BuildContext context) => new HomePage(),
        '/login': (BuildContext context) => new Login_page(),
        '/about': (BuildContext context) => new AboutPage(),


      },
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _login = false;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _login = (prefs.getBool('login')?? false);
    });
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _login = true;
    });
    prefs.setBool('login', _login);
  }







  @override
  Widget build(BuildContext context){
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  /*  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child: Text('Hello',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold)),
                  ),*/
                  Container(
                    padding: EdgeInsets.fromLTRB(100.0, 100.0, 0.0, 0.0),
                    child: Text('ورود',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold,color: Colors.red)),
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    new Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextField(
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                            labelText: 'نام کاربری',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red))),
                      ),),
                    SizedBox(height: 20.0),
                    new Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextField(
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                            labelText: 'رمز عبور',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red))),
                        obscureText: true,
                      ),),
                    SizedBox(height: 5.0),
                    SizedBox(height: 40.0),
                    Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.redAccent,
                        color: Colors.red,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {
                          _incrementCounter();
                          Navigator.of(context).pushReplacementNamed('/home');
                          },
                          child: Center(
                            child: Text(
                              'ورود',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                  ],
                )),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('/signup');
                  },
                  child: Text(
                    'ثبت نام',
                    style: TextStyle(
                        color: Colors.red,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                ),
                Text(
                  'برای ثبت نام کلیک کنید',
                  style: TextStyle(fontFamily: 'Montserrat'),
                )
              ],
            )
          ],
        ));
  }
}
