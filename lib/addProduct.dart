import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'addProduct.dart';
import 'delProduct.dart';
import 'searchProduct.dart';
import 'listProduct.dart';
import 'updateProduct.dart';
import 'package:firebase_database/firebase_database.dart';
import 'success.dart';

class addProduct extends StatefulWidget {
  @override
  _addProductState createState() => _addProductState();
}

class _addProductState extends State<addProduct> {
  //navigator to success screen
  void _navigateToScreenSuccess(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => success()));
  }
  String InvalidStatement="";
  //function to add data to firebase
  void addData(String name,double price,int quantity){
    DatabaseReference _ref;
    _ref=FirebaseDatabase.instance.reference().child("products");
    _ref.push().set({'name':name,'price':price,'quantity':quantity,'img':"img/car.png"});
  }
  //-------------------------------
  String dropdownValue;
  var nameCont = TextEditingController();
  var passCont = TextEditingController();
  var quanCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: Icon(Icons.menu,),
            title: Text('Add Product'),
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
                              Icons.fastfood,
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
                            hintText: "price",
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            icon: Icon(
                              Icons.euro_symbol,
                              color: Colors.purple,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),//price

                      Container(
                        margin: EdgeInsets.all(12.0),
                        child: TextField(
                          maxLength: 30,
                          controller: quanCont,
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
                            hintText: "quantity",
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            icon: Icon(
                              Icons.timeline,
                              color: Colors.purple,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),//quantity


                      RaisedButton(
                        onPressed: () {
                          if(nameCont.text=="" || passCont.text==""){
                            setState(() {
                              InvalidStatement="Please enter all fields!!";
                            });
                          }else{
                            var price = double.parse(passCont.text);
                            var quan =  int.parse(quanCont.text);
                            addData(nameCont.text, price, quan);
                            setState(() {
                              nameCont.text = "";
                              passCont.text = "";
                              quanCont.text = "";
                              InvalidStatement="";
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
                          const Text('Submit', style: TextStyle(fontSize: 20)),
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
