import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'addProduct.dart';
import 'delProduct.dart';
import 'searchProduct.dart';
import 'listProduct.dart';
import 'updateProduct.dart';
class listProduct extends StatefulWidget {
  @override
  _listProductState createState() => _listProductState();
}

class _listProductState extends State<listProduct> {


  Query _ref;
  @override
  void initState() {
    //retrieve();
    super.initState();
    _ref=FirebaseDatabase.instance.reference().child("products");

  }

  Widget productitems({Map product})
  {
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
                                Text("price : ${product['price']}",style: TextStyle(color: Colors.white),)
                              ],
                            ),
                            Row(
                              children: [
                                Text("quantity : ${product['quantity']}",style: TextStyle(color: Colors.white),)
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

          appBar: AppBar(
            leading: Image.asset("img/car.png"),
            title: Text('List Product'),
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
}



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