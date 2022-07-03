import 'dart:convert';

import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ultramarket/success.dart';
import 'addEmp.dart';
import 'listEmp.dart';
import 'delEmp.dart';
import 'searchEmp.dart';
import 'package:http/http.dart' as http;


class updateEmp extends StatefulWidget {
  @override
  _updateEmpState createState() => _updateEmpState();
}

class _updateEmpState extends State<updateEmp> {

  //Function to update data
  Future<void> updateData(String name,String pass,String newName,String newPass) async{
    var id;
    var ref = FirebaseDatabase.instance.reference().child("users");
    ref.once().then((DataSnapshot snapshot){
      snapshot.value.forEach((key,values) async {
        if(values['name']==name && values['password']==pass){
          id= key;
          print(";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;");
          print(id);print(newName);print(newPass);
          final String url = "https://ultra-market-4d5be-default-rtdb.firebaseio.com/users/$id.json";
          var res = await http.patch(url,body: json.encode({
            "name": newName,
            "password": newPass,
          }));
        }
      });
    });
  }
  //-------------------
  //navigator to success screen
  void _navigateToScreenSuccess(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => success()));
  }
  var nameCont = TextEditingController();
  var passCont = TextEditingController();
  static var nameContUpdate = TextEditingController();
  static var passContUpdate = TextEditingController();
  //static String dropdownValueUpdate;
  String InvalidStatement = "";
  String dropdownValue;
  Widget changeUpdate = Container();

  //three text field widget
  // Widget typeUpdate = Container(
  //     width: 210,
  //     margin: EdgeInsets.all(1.0),
  //     child: Stack(
  //       children: [
  //         // Container(
  //         //   child: Icon(
  //         //     Icons.menu,
  //         //     color: Colors.purple,
  //         //     size: 20.0,
  //         //   ),
  //         // ),
  //         Container(
  //           //padding: EdgeInsets.only(left: 44.0),
  //           child: DropdownButton<String>(
  //             hint:  Text("Select Type",style: TextStyle(color: Colors.white),),
  //             dropdownColor: Colors.purpleAccent,
  //             focusColor: Colors.purpleAccent,
  //             iconEnabledColor: Colors.purpleAccent,
  //             value: dropdownValueUpdate,
  //             icon: Icon(Icons.arrow_drop_down),
  //             iconSize: 24,
  //             elevation: 16,
  //             style: TextStyle(color: Colors.white),
  //             underline: Container(
  //               height: 1,
  //               color: Colors.purpleAccent,
  //             ),
  //             onChanged: (String newValue) {
  //                 this.setState(() {
  //                   dropdownValueUpdate = newValue;
  //                 });
  //             },
  //             items: <String>['Seller', 'Inventory', 'Admin']
  //                 .map<DropdownMenuItem<String>>((String value) {
  //               return DropdownMenuItem<String>(
  //                 value: value,
  //                 child: Text(value),
  //               );
  //             }).toList(),
  //           ),
  //         ),
  //       ],
  //     )
  // );


  Widget nameUpdate = Container(
    margin: EdgeInsets.all(12.0),
    child: TextField(
      maxLength: 30,
      controller: _updateEmpState.nameContUpdate,
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
        hintText: "New Name",
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
  );

  var passUpdate = Container(
    margin: EdgeInsets.all(12.0),
    child: TextField(
      maxLength: 30,
      controller: _updateEmpState.passContUpdate,
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
        hintText: "New Password",
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
  );


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: Image.asset("img/car.png"),
          title: Text('Update Employee'),
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
            padding: const EdgeInsets.fromLTRB(40, 115, 40, 0),
            child: SingleChildScrollView(

              child: Container(
                height: 450,
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

                    Container(
                        width: 210,
                        margin: EdgeInsets.all(1.0),
                        child: Stack(
                          children: [
                            // Container(
                            //   child: Icon(
                            //     Icons.menu,
                            //     color: Colors.purple,
                            //     size: 20.0,
                            //   ),
                            // ),
                            Container(
                              //padding: EdgeInsets.only(left: 44.0),
                              child: DropdownButton<String>(
                                hint:  Text("Update",style: TextStyle(color: Colors.white),),
                                dropdownColor: Colors.purpleAccent,
                                focusColor: Colors.purpleAccent,
                                iconEnabledColor: Colors.purpleAccent,
                                value: dropdownValue,
                                icon: Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                elevation: 16,
                                style: TextStyle(color: Colors.white),
                                underline: Container(
                                  height: 1,
                                  color: Colors.purpleAccent,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValue = newValue;
                                  });
                                  switch(dropdownValue){
                                    case "Name":
                                      setState(() {
                                        changeUpdate=nameUpdate;
                                      });
                                      break;
                                    case "Password":
                                      setState(() {
                                        changeUpdate=passUpdate;
                                      });
                                      break;
                                  }
                                },
                                items: <String>['Name', 'Password']
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        )
                    ),


                    changeUpdate,


                    RaisedButton(
                      onPressed: () {
                        if(nameCont.text=="" || passCont.text==""){
                          setState(() {
                            InvalidStatement="Please enter all fields!!";
                          });
                        }else {
                          if (dropdownValue == "Name") {
                            setState(() {
                              passContUpdate.text = passCont.text;
                            });
                          } else {
                            setState(() {
                              nameContUpdate.text = nameCont.text;
                            });
                          }
                          updateData(
                              nameCont.text, passCont.text, nameContUpdate.text,
                              passContUpdate.text);
                          setState(() {
                            nameCont.text = "";
                            passCont.text = "";
                            nameContUpdate.text="";
                            passContUpdate.text="";
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
                        const Text('Update', style: TextStyle(fontSize: 20)),
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
