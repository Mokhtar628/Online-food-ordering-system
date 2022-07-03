import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'addEmp.dart';
import 'listEmp.dart';
import 'searchEmp.dart';
import 'updateEmp.dart';

class success extends StatefulWidget {
  @override
  _successState createState() => _successState();
}

class _successState extends State<success> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

          appBar: AppBar(
            leading: Image.asset("img/car.png"),
            title: Text('Done Successfully'),
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
                  Text("Done",style: TextStyle(color: Colors.green,fontSize: 39),),
                  Text("Successfully",style: TextStyle(color: Colors.green,fontSize: 39),),
                  Image.asset("img/true.png",width: 210,),
                ],
              ),
            ),
          ),


      ),
    );
  }
}
