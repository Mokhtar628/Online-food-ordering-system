import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:ultramarket/main.dart';

class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:  SplashScreen(
            seconds: 5,
            navigateAfterSeconds: Login(),
            title: new Text('Eshtry',
              style: new TextStyle(
                  color: Colors.amberAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0
              ),),
            image: new Image.asset("img/car.png"),
            backgroundColor: Colors.deepPurple,
            styleTextUnderTheLoader: new TextStyle(),
            photoSize: 100.0,
            onClick: ()=>print(""),
            loaderColor: Colors.amberAccent,
            loadingText: Text("Powered by Mokh",style: TextStyle(color: Colors.amberAccent),),
        ),
      ),
    );
  }
}