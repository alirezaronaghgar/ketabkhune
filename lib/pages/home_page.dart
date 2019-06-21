import 'package:flutter/material.dart';
import 'package:ketabkhune/pages/about_page.dart';
import 'package:ketabkhune/books.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ketabkhune/books_detail.dart';


class HomePage extends StatefulWidget {
  @override
  startAppState createState() {
    return new startAppState();
  }
}

class startAppState extends State<HomePage> {
  booky book_tst;
  var url =
      "https://api.myjson.com/bins/zy2yx";

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);

    var jsondecoder = json.decode(utf8.decode(res.bodyBytes));
    book_tst = booky.fromJson(jsondecoder);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("کتابخونه"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: book_tst == null
          ? Center(child: CircularProgressIndicator())
          : GridView.count(
        crossAxisCount: 1,
        children: book_tst.bok
            .map((poke) => Padding(
            padding: const EdgeInsets.all(1.5),
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              books_detail(test: poke)));
                },
                child: Hero(
                    tag: poke.img,
                    child: Card(
                        color: Colors.deepPurpleAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(85)),
                        elevation: 3.0,
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(poke.img))),
                            ),
                            Text(
                              poke.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0),
                            )
                          ],
                        ))))))
            .toList(),
      ),
     drawer:Drawer(
       child: ListView(
         padding: EdgeInsets.zero,
         children: <Widget>[
           DrawerHeader(
             child: Text('کتابخونه',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 26),),
             decoration: BoxDecoration(
               color: Colors.orange,
             ),
           ),
           ListTile(
             title: Text('نویسنده',style: TextStyle(fontSize: 20),),
             onTap: () {
               Navigator.push(
                   context,
                   MaterialPageRoute(
                       builder: (context) =>
                           AboutPage()));
             },
           ),
         ],
       ),
     )
    );
  }
}
