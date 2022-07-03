import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ultramarket/success.dart';
import 'dart:convert';
import 'addEmp.dart';
import 'listEmp.dart';
import 'searchEmp.dart';
import 'updateEmp.dart';

class delEmp extends StatefulWidget {
  @override
  _delEmpState createState() => _delEmpState();
}

class _delEmpState extends State<delEmp> {
  //navigator to success screen
  void _navigateToScreenSuccess(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => success()));
  }
  //functoin to delete data from firebase
  Future<void> delData (String name , String pass) async {
     var id;
    var ref = FirebaseDatabase.instance.reference().child("users");
    ref.once().then((DataSnapshot snapshot){
      snapshot.value.forEach((key,values) async {
        if(values['name']==name && values['password']==pass){
          id= key;
          print(id);
          final String url = "https://ultra-market-4d5be-default-rtdb.firebaseio.com/users/$id.json";
          var res = await http.delete(url);
        }
      });
    });
  }
  //------------------------------------
  String InvalidStatement="";
  String dropdownValue;
  var nameCont = TextEditingController();
  var passCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: Icon(Icons.menu,),
          title: Text('Delete Employee'),
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

          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 130, 40, 0),
            child: SingleChildScrollView(

              child: Container(
                height: 400,
                alignment: Alignment.center,
                color: Color(0x70000000),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(12.0),
                      child: TextField(
                        maxLength: 30,
                        controller: nameCont,
                        //save inputs
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        //input text color
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purpleAccent),
                            //  when the TextFormField in unfocused
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.amberAccent),
                            //  when the TextFormField in focused
                          ),
                          hintText: "Name",
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          icon: Icon(
                            Icons.person,
                            color: Colors.purple,
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),//name

                    Container(
                      margin: EdgeInsets.all(12.0),
                      child: TextField(
                        maxLength: 30,
                        controller: passCont,
                        //save inputs
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        //input text color
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purpleAccent),
                            //  when the TextFormField in unfocused
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.amberAccent),
                            //  when the TextFormField in focused
                          ),
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          icon: Icon(
                            Icons.vpn_key,
                            color: Colors.purple,
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),//pass



                    RaisedButton(
                      onPressed: () {
                        if(nameCont.text=="" || passCont.text==""){
                          setState(() {
                          InvalidStatement="Please enter all fields!!";
                        });
                        }else {
                          delData(nameCont.text, passCont.text);
                          setState(() {
                            nameCont.text = "";
                            passCont.text = "";
                          });
                          _navigateToScreenSuccess(context);
                        }
                      },
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        width: 235,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Colors.deepPurple,
                              Colors.purple,
                              Colors.purpleAccent,
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child:
                        const Text('Delete', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    Text(InvalidStatement,style: TextStyle(color: Colors.red),),

                  ],
                ),
              ),
            ),
          ),
        ),

          floatingActionButton: FabCircularMenu(
              fabColor: Colors.purple,
              ringColor: Colors.purple,
              fabOpenIcon: Icon(Icons.menu,color: Colors.white,),
              fabCloseIcon: Icon(Icons.close,color: Colors.white,),
              children: <Widget>[
                IconButton(icon: Icon(Icons.add,color: Colors.white,), onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => addEmp()));
                }),
                IconButton(icon: Icon(Icons.search,color: Colors.white), onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => searchEmp()));
                }),
                IconButton(icon: Icon(Icons.delete,color: Colors.white), onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => delEmp()));
                }),
                IconButton(icon: Icon(Icons.edit,color: Colors.white), onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => updateEmp()));
                }),
                IconButton(icon: Icon(Icons.list,color: Colors.white), onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => listEmp()));
                }),
              ]
          )
      ),
    );
  }
}
