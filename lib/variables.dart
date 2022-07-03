

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ultramarket/seller.dart';
import 'package:ultramarket/wrong.dart';
import 'dart:convert';
import 'admin.dart';
import 'inventory.dart';

var nameCont = TextEditingController();
var passCont = TextEditingController();
String InvalidStatement = "";


class Users {
  final String name;
  final String password;
  final int type;

  Users({this.name, this.password, this.type});


  // Convert a emp into a Map. The keys must correspond to the names of the
  // // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'password': password,
      'type': type,
    };
 }
}



Future<void> CheckUsers(String name,String pass,BuildContext context) async{
  //_navigateToScreenAdmin(context,"user.name");
  final String url = "https://ultra-market-4d5be-default-rtdb.firebaseio.com/users.json";
  final http.Response res = await http.get(url);
  final data = json.decode(res.body) as Map<String, dynamic>;
  Users user;
  int wrong = 0,ctr=0;
  data.forEach((key, value) {
    user = Users(
        name: value["name"],
        password: value["password"] ,
        type: value["type"]
    );
    if(user.name==name && user.password==pass){
      ctr++;
      if(user.type==1)
        _navigateToScreenAdmin(context,user.name);
      else if(user.type==2)
        _navigateToScreenInventory(context,user.name);
      else if(user.type==3)
        _navigateToScreenSeller(context, user.name);
      else
        _navigateToScreenWrong(context);

    }
    else{
      wrong++;
      ctr++;
    }


  });
  if(wrong==ctr)
    _navigateToScreenWrong(context);
  //_navigateToScreenAdmin(context,"user.name");
}

// Future<void> CheckUsers(String name,String pass,BuildContext context) async{
//   DatabaseReference usersRef = FirebaseDatabase.instance.reference().child("users");
//   usersRef.once().then((DataSnapshot snap){
//
//     var DATA = snap.value;
//
//     for(int i = 1 ; i < DATA.length ; i ++){
//       Users user = new Users(
//           DATA[i]['name'],
//           DATA[i]['password'],
//           DATA[i]['type']
//       );
//       if(user.name==name && user.password==pass){
//         if(user.type==1)
//           _navigateToScreenAdmin(context,user.name);
//       }
//     }
//   });
// }

void _navigateToScreenAdmin(BuildContext context,String name) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => admin(name)));
}

void _navigateToScreenInventory(BuildContext context,String name) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => inventory(name)));
}

void _navigateToScreenSeller(BuildContext context,String name) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => seller(name)));
}

void _navigateToScreenWrong(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => wrong()));
}

