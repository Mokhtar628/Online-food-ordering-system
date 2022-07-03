import 'dart:convert';

import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ultramarket/success.dart';
import 'addProduct.dart';
import 'delProduct.dart';
import 'searchProduct.dart';
import 'listProduct.dart';
import 'package:http/http.dart' as http;

class updateProduct extends StatefulWidget {
  @override
  _updateProductState createState() => _updateProductState();
}

class _updateProductState extends State<updateProduct> {

  //Function to update data
  Future<void> updateData(String name,String newName,double newprice,int newquan) async{
    var id;
    var ref = FirebaseDatabase.instance.reference().child("products");
    ref.once().then((DataSnapshot snapshot){
      snapshot.value.forEach((key,values) async {
        if(values['name']==name){
          id= key;
          print(";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;");
          print(id);print(newName);print(newprice);
          final String url = "https://ultra-market-4d5be-default-rtdb.firebaseio.com/products/$id.json";
          var res = await http.patch(url,body: json.encode({
            "name": newName,
            "price": newprice,
            "quantity":newquan
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
  static var nameContUpdate = TextEditingController();
  static var priceContUpdate = TextEditingController();
  static var quanContUpdate = TextEditingController();
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
      controller: _updateProductState.nameContUpdate,
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

  var priceUpdate = Container(
    margin: EdgeInsets.all(12.0),
    child: TextField(
      maxLength: 30,
      controller: _updateProductState.priceContUpdate,
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
        hintText: "New price",
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        icon: Icon(
          Icons.vpn_key,
          color: Colors.purple,
        ),
      ),
      keyboardType: TextInputType.number,
    ),
  );

  var quanUpdate = Container(
    margin: EdgeInsets.all(12.0),
    child: TextField(
      maxLength: 30,
      controller: _updateProductState.quanContUpdate,
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
        hintText: "New quantity",
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        icon: Icon(
          Icons.vpn_key,
          color: Colors.purple,
        ),
      ),
      keyboardType: TextInputType.number,
    ),
  );


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading:Image.asset("img/car.png"),
            title: Text('Update Product'),
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
                                      case "price":
                                        setState(() {
                                          changeUpdate=priceUpdate;
                                        });
                                        break;
                                      case "quantity":
                                        setState(() {
                                          changeUpdate=quanUpdate;
                                        });
                                        break;
                                    }
                                  },
                                  items: <String>['Name', 'price','quantity']
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
                        onPressed: () async {
                          final String url = "https://ultra-market-4d5be-default-rtdb.firebaseio.com/products.json";
                          final http.Response res = await http.get(url);
                          final data = json.decode(res.body) as Map<String, dynamic>;
                          String currentName;
                          double currentPrice;
                          int currentQuan;
                          Products product;

                          data.forEach((key, value) {
                            product = Products(
                                name: value["name"],
                                price: value["price"] +.0,
                                quantity: value["quantity"]
                            );
                            if(nameCont.text==value["name"]){
                              currentName=value["name"];
                              currentPrice=value["price"] +.0;
                              currentQuan=value["quantity"];
                            }
                          });

                          var price;
                          var quantity;

                          if(nameCont.text==""){
                            setState(() {
                              InvalidStatement="Please enter all fields!!";
                            });
                          }else {
                            if (dropdownValue == "Name") {
                              setState(() {
                                price = currentPrice;
                                quantity=currentQuan;
                              });
                            }else if (dropdownValue == "price"){
                              setState(() {
                                quantity=currentQuan;
                                nameContUpdate.text=currentName;
                                price = double.parse(priceContUpdate.text);
                              });
                            }
                            else {
                              setState(() {
                                price = currentPrice;
                                nameContUpdate.text=currentName;
                                quantity = int.parse(quanContUpdate.text);
                              });
                            }


                            updateData(
                                nameCont.text, nameContUpdate.text,price
                                ,quantity);
                            setState(() {
                              nameCont.text = "";
                              nameContUpdate.text="";
                              priceContUpdate.text="";
                              quanContUpdate.text="";
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



class Products {
  final String name;
  final double price;
  final int quantity;

  Products({this.name, this.price, this.quantity});

}