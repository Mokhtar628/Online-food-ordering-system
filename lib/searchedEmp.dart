

import 'package:flutter/material.dart';

class searchedEmp extends StatefulWidget {
  String name ,pass;
  int type;
  searchedEmp(String this.name,String this.pass,int this.type);
  @override
  _searchedEmpState createState() => _searchedEmpState(name,pass,type);
}

class _searchedEmpState extends State<searchedEmp> {
  String name ,pass;
  int type;
  _searchedEmpState(String this.name,String this.pass,int this.type);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        appBar: AppBar(
          titleSpacing: 0,
          title: TextBox(),
          actions: <Widget>[
            RaisedButton(
              textColor: Colors.white,
              color: Colors.purple,
              onPressed: () {
                setState(() {

                });
              },
              child: Icon(Icons.search),
            ),
          ],

          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Colors.deepPurple,
                      Colors.purple,
                      Colors.purpleAccent
                    ])
            ),
          ),
        ),// app bar end here --------------------------

        body: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                    image: AssetImage("img/splash.jpg"),
                    fit: BoxFit.cover,
                    ),
                ),
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            width: 280,
                            height: 90,
                            //alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [Colors.deepPurple,Colors.purple,Colors.purpleAccent]),
                              borderRadius: BorderRadius.circular(50),
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.orangeAccent.withOpacity(0.5),
                              //     spreadRadius: 5,
                              //     blurRadius: 7,
                              //     offset: Offset(0, 3), // changes position of shadow
                              //   ),
                              // ],
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("Name : "+name,style: TextStyle(color: Colors.white),)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Password : "+pass,style: TextStyle(color: Colors.white),)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Type : "+empCheckType(type),style: TextStyle(color: Colors.white),)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12,),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ),
    ));
  }

  String empCheckType(int type) {
    switch(type){
      case 1:
        return "Admin";
        break;
      case 2:
        return "Seller";
        break;
      case 3:
        return "Inventory";
        break;
    }
  }
}


class TextBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.white,
      height: 80,
      child: TextField(
        decoration:
        InputDecoration(border: InputBorder.none, hintText: 'Search employee',contentPadding: EdgeInsets.fromLTRB(20,0,0,0),),
      ),
    );
  }
}