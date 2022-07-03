
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter_spinbox/material.dart';
import 'package:ultramarket/success.dart';

class seller extends StatefulWidget {
  String name;
  seller(String this.name);
  @override
  _sellerState createState() => _sellerState(name);
}

class _sellerState extends State<seller> {

  //navigator to success screen
  void _navigateToScreenSuccess(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => success()));
  }
  Query _ref;
  String name;
  int quan;
  double totalCash=0;
  _sellerState(String this.name);
  Map<String,dynamic> testMap = {
    'name': "name",
    'quantity': "quantity",
    'price': "price",
    'total': "Total"
  };
  List<Map<String,dynamic>> card = [];
  @override
  void initState() {
    //retrieve();
    super.initState();
    _ref=FirebaseDatabase.instance.reference().child("products").orderByChild("name");

  }

  Widget cardChecks (List<Map<String,dynamic>> card){
    var len=card?.length ?? 0;
    print("'''''''object'''''''");
    print(len);
    if(len==0)
      len=0;
    else
      len=card.length;

    for(int i = 0 ; i < len ; i++){
      return Container(
        alignment: Alignment.center,
        color: Colors.grey,
        height: 60,
        width: 200,

        child: Row(
          children: [
            Text("${card[i]['name']}",style: TextStyle(color: Colors.white),),SizedBox(width: 20,),
            Text("${card[i]['quantity']}",style: TextStyle(color: Colors.white),),SizedBox(width: 20,),
            Text("${card[i]['price']}",style: TextStyle(color: Colors.white),),SizedBox(width: 20,),
            Text("${card[i]['total']}",style: TextStyle(color: Colors.white),),
            SizedBox(height: 30,),
          ],
        ),
      );
    }

  }
  
  Widget productcards({Map product}){
      bool isdisapled = false;
      Function pressed(){
        if(isdisapled)
          return null;
        else {
          return () {
            bool check = true;
            for(var i in card){
              if (i['name']==product['name']){
                setState(() {
                  check=false;
                  quan=1;
                });
              }
            }
            if(check){
              Map<String,dynamic> map ={};
              var q = quan;
              print(";;;;;;;;;;;;;;;;;;;;;;;;;");
              print(quan);
              setState(() {
                totalCash+=double.parse((q* product['price']).toStringAsFixed(2));
                map = {
                  'img': product['img'],
                  'name': product['name'],
                  'price': product['price'],
                  'quantity': q,
                  'total': double.parse((q* product['price']).toStringAsFixed(2))
                };
                isdisapled=!isdisapled;
                print(isdisapled);
                quan=1;
              });
              card.add(map);
              // for(int i = 0 ; i < card.length ; i++)
              //   print(card[i]);
            }
          };
        }
      }
      return Padding(
        padding: const EdgeInsets.fromLTRB(8, 15, 8, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(
                  children: <Widget>[
                    Image.asset(product['img'],width: 100,height: 100,),
                    Container(alignment:Alignment.center,child: Text(product['name'],style: TextStyle(color: Colors.black),)),
                    Container(alignment:Alignment.center,child: Text("${product['price']}"+"\$",style: TextStyle(color: Colors.red),)),
                    Container(
                      child: SpinBox(
                        min: 1,
                        max: 20,
                        value: 1,
                        onChanged:  (value){
                          setState(() {
                            quan = value.toInt();
                          });
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: RaisedButton(
                        color: Colors.purple,
                        onPressed: pressed(),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50.0),
                                bottomRight: Radius.circular(50.0))),
                        child: Text("Add to card",style: TextStyle(color: Colors.white),),

                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
                Expanded(
                  child: FirebaseAnimatedList(query: _ref,scrollDirection:Axis.horizontal,itemBuilder: (BuildContext context ,DataSnapshot snapshot,Animation<double>animation,int index){
                    Map product = snapshot.value;
                    return productcards(product: product);
                  }),
                ),
                Container(
                  width: double.infinity,
                  height: 400,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 11, 0, 0),
                        child: Text("My Card",style: TextStyle(color: Colors.black,fontSize: 35),),
                      ),
                      SizedBox(height: 10,),
                      SingleChildScrollView(
                        child: Container(
                          height: 250,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                // if(card.length!=0)
                                //   cardChecks(card),
                                for(int i = 0 ; i < card.length ; i++)  Container( alignment: Alignment.center, color: Colors.grey, height: 40, width: 310, margin: const EdgeInsets.fromLTRB(0, 12, 0, 0),padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [ Image.asset(card[i]['img'],height: 35,),SizedBox(width: 20,),Text("${card[i]['name']}",style: TextStyle(color: Colors.white),),SizedBox(width: 20,), Text("${card[i]['quantity']}",style: TextStyle(color: Colors.white),),SizedBox(width: 20,), Text("${card[i]['price']}",style: TextStyle(color: Colors.white),),SizedBox(width: 20,), Text("${card[i]['total']}",style: TextStyle(color: Colors.white),),  IconButton(alignment:Alignment.centerRight,icon: Icon(Icons.close,color: Colors.white,), onPressed: (){setState(() {card.removeWhere((element) => (element['name']==card[i]['name'] && element['total']==card[i]['total'] && !((totalCash-=(element['total']))==-1)));});})], ), )
                                //Map<String,dynamic> delMap = {'img': card[i]['img'],'name': card[i]['name'],'quantity': card[i]['quantity'],'price': card[i]['price'],'total':card[i]['total']};---------totalCash-=double.parse((card[i]['total']).toStringAsFixed(2));--totalCash-=card.where((element) => element['name']==card[i]['name'] &&  element['total']==card[i]['total'])['total'];
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RaisedButton(
                                onPressed: (){
                                  setState(() {
                                    card.clear();
                                    totalCash=0;
                                  });
                                  _navigateToScreenSuccess(context);
                                },
                                color: Colors.purple,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              child: Text("Buy",style: TextStyle(color: Colors.white),),
                            ),
                            SizedBox(width: 25,),
                            RaisedButton(
                              onPressed: (){
                                setState(() {
                                  card.clear();
                                  totalCash=0;
                                });
                              },
                              color: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Text("Cancel",style: TextStyle(color: Colors.white),),
                            ),

                          ],
                        ),

                      ),
                      Text("Total : ${totalCash.toStringAsFixed(2)}\$")
                    ],
                  ),
                )
              ],
            ),
          ),


      ),
    );
  }
}
