
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'addProduct.dart';
import 'delProduct.dart';
import 'searchProduct.dart';
import 'listProduct.dart';
import 'updateProduct.dart';


class inventory extends StatefulWidget {
  String name;
  inventory(String this.name);
  @override
  _inventoryState createState() => _inventoryState(name);
}

class _inventoryState extends State<inventory> {
  String name;
  _inventoryState(String this.name);

  //navigator Functions for all accessableity
  void _navigateToScreenAddProduct(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => addProduct()));
  }
  void _navigateToScreenSearchProduct(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => searchProduct()));
  }
  void _navigateToScreenListProduct(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => listProduct()));
  }
  void _navigateToScreenDelProduct(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => delProduct()));
  }
  void _navigateToScreenUpdateProduct(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => updateProduct()));
  }
  // -----------------------------------------

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

          appBar: AppBar(
            leading: Image.asset("img/car.png"),
            title: Text('Welcome '+name),
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
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(210, 0, 0, 0),
                  color: Colors.purpleAccent,
                  child: Text("Inventory Field",style: TextStyle(color: Colors.white),),
                ),
                SizedBox(height: 20,),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 25,
                    padding: EdgeInsets.all(20),
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(color: Colors.white,spreadRadius: 0.5),
                            ],
                          ),
                          child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 30)),
                        ),
                        onTap: () {
                          _navigateToScreenAddProduct(context);
                        },
                      ),

                      InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(color: Colors.white,spreadRadius: 0.5),
                            ],
                          ),
                          child: Text("Delete",style: TextStyle(color: Colors.white,fontSize: 30,)),
                        ),
                        onTap: () {
                          _navigateToScreenDelProduct(context);
                        },
                      ),

                      InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(color: Colors.white,spreadRadius: 0.5),
                            ],
                          ),
                          child: Text("Update",style: TextStyle(color: Colors.white,fontSize: 30,)),
                        ),
                        onTap: () {
                          _navigateToScreenUpdateProduct(context);
                        },
                      ),

                      InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(color: Colors.white,spreadRadius: 0.5),
                            ],
                          ),
                          child: Text("Search",style: TextStyle(color: Colors.white,fontSize: 30,)),
                        ),
                        onTap: () {
                          _navigateToScreenSearchProduct(context);
                        },
                      ),

                      InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(color: Colors.white,spreadRadius: 0.5),
                            ],
                          ),
                          child: Text("List",style: TextStyle(color: Colors.white,fontSize: 30,)),

                        ),
                        onTap: () {
                          _navigateToScreenListProduct(context);
                        },
                      ),
                    ],

                  ),
                )

              ],
            ),
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
