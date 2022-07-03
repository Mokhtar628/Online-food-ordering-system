//import 'dart:convert';
import 'package:fab_circular_menu/fab_circular_menu.dart';
//import 'package:http/http.dart' as http;
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:ultramarket/searchedProduct.dart';
// import 'navigaterAdminFunction.dart';
// import 'package:flutter/material.dart';
// import 'searchEmp.dart';
import 'addProduct.dart';
import 'delProduct.dart';
import 'listProduct.dart';
import 'updateProduct.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var SearchCont = TextEditingController();

class searchProduct extends StatefulWidget {
  @override
  _searchProductState createState() => _searchProductState();
}

class _searchProductState extends State<searchProduct> {

  void _navigateToScreenSearchedProduct(BuildContext context,String name,double price,int quantity) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => searchedProduct(name,price,quantity)));
  }
  String empCheckType(int type){
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
  Query _ref;
  TextBox textBox;
  var nameToSearch;
  var displayEmp;

  // Future<Map<String, dynamic>> retrive(BuildContext context) async{
  //   final String url = "https://ultra-market-4d5be-default-rtdb.firebaseio.com/users.json";
  //   final http.Response res = await http.get(url);
  //   final data = json.decode(res.body) as Map<String, dynamic>;
  //   Users user;
  //   data.forEach((key, value) {
  //     user = Users(
  //         name: value["name"],
  //         password: value["password"] ,
  //         type: value["type"]
  //     );
  //     if(user.name==SearchCont.text) {
  //       return user;
  //     }
  //   });
  // }

  @override
  void initState() {
    //retrieve();
    super.initState();
    _ref=FirebaseDatabase.instance.reference().child("products");


  }
  Widget productitems({Map product})
  {
    if(true){//SearchCont.text == emp['name']
      return Container(
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
                                  Text("Name : ${product['name']}",style: TextStyle(color: Colors.white),)
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Password : ${product['price']}",style: TextStyle(color: Colors.white),)
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Type : ${product['quantity']}",style: TextStyle(color: Colors.white),)
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
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            titleSpacing: 0,
            title: TextBox(),
            actions: <Widget>[
              RaisedButton(
                textColor: Colors.white,
                color: Colors.purple,
                onPressed: () {
                  setState(() {
                    searchfun(SearchCont.text,context);
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

            child: FirebaseAnimatedList(query: _ref,itemBuilder: (BuildContext context ,DataSnapshot snapshot,Animation<double>animation,int index){
              Map product = snapshot.value;
              return productitems(product: product);
            }),
          ),

          floatingActionButton: FabCircularMenu(
              fabColor: Colors.purple,
              ringColor: Colors.purple,
              fabOpenIcon: Icon(Icons.menu,color: Colors.white,),
              fabCloseIcon: Icon(Icons.close,color: Colors.white,),
              children: <Widget>[
                IconButton(icon: Icon(Icons.add,color: Colors.white,), onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => addProduct()));
                }),
                IconButton(icon: Icon(Icons.search,color: Colors.white), onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => searchProduct()));
                }),
                IconButton(icon: Icon(Icons.delete,color: Colors.white), onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => delProduct()));
                }),
                IconButton(icon: Icon(Icons.edit,color: Colors.white), onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => updateProduct()));
                }),
                IconButton(icon: Icon(Icons.list,color: Colors.white), onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => listProduct()));
                }),
              ]
          )
      ),
    );
  }

  // Future<void> searchfun(String text,BuildContext context) async {
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
  //       if(user.name.toLowerCase()==text.toLowerCase()){
  //         _navigateToScreenSearchedEmp(context,user.name,user.password,user.type);
  //       }
  //     }
  //   });
  //
  // }

  Future<void> searchfun(String text,BuildContext context) async{
    final String url = "https://ultra-market-4d5be-default-rtdb.firebaseio.com/products.json";
    final http.Response res = await http.get(url);
    final data = json.decode(res.body) as Map<String, dynamic>;
    Products product;
    data.forEach((key, value) {
      product = Products(
          name: value["name"],
          price: value["price"] +.0,
          quantity: value["quantity"]
      );
      if(product.name.toLowerCase()==text.toLowerCase()){
        _navigateToScreenSearchedProduct(context,product.name,product.price,product.quantity);
      }
    });
  }

  // void searchfun(String text,BuildContext context) {
  //   var ref = FirebaseDatabase.instance.reference().child("products");
  //   ref.once().then((DataSnapshot snapshot){
  //     snapshot.value.forEach((key,values)  {
  //       if(values['name']==text){
  //         _navigateToScreenSearchedProduct(context,values['name'],values['price'],values['quantity']);
  //       }
  //     });
  //   });
  // }

}


class TextBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.white,
      height: 80,
      child: TextField(
        controller: SearchCont,
        decoration:
        InputDecoration(border: InputBorder.none, hintText: 'Search product',contentPadding: EdgeInsets.fromLTRB(20,0,0,0),),
      ),
    );
  }
}


class Products {
  final String name;
  final double price;
  final int quantity;

  Products({this.name, this.price, this.quantity});

}