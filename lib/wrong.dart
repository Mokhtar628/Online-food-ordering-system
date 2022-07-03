import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'addEmp.dart';
import 'listEmp.dart';
import 'searchEmp.dart';
import 'updateEmp.dart';

class wrong extends StatefulWidget {
  @override
  _wrongState createState() => _wrongState();
}

class _wrongState extends State<wrong> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        appBar: AppBar(
          leading: Image.asset("img/car.png"),
          title: Text('Something Wrong'),
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
            alignment: Alignment.center,
            color: Color(0x70000000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Something",style: TextStyle(color: Colors.red,fontSize: 39),),
                Text("Wrong",style: TextStyle(color: Colors.red,fontSize: 39),),
                Image.asset("img/wrong.png",width: 180,),
              ],
            ),
          ),
        ),


      ),
    );
  }
}
