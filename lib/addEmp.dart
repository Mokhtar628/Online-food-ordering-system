import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'searchEmp.dart';
import 'listEmp.dart';
import 'delEmp.dart';
import 'updateEmp.dart';
import 'package:firebase_database/firebase_database.dart';
import 'success.dart';

class addEmp extends StatefulWidget {
  @override
  _addEmpState createState() => _addEmpState();
}

class _addEmpState extends State<addEmp> {
  //navigator to success screen
  void _navigateToScreenSuccess(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => success()));
  }
  String InvalidStatement="";
  //function to add data to firebase
  void addData(String name,String pass,String type){
    int type_int=0;
    switch(type.toLowerCase()){
      case "inventory":
        type_int=3;
        break;
      case "seller":
        type_int=2;
        break;
      case "admin":
        type_int=1;
        break;
    }
    DatabaseReference _ref;
    _ref=FirebaseDatabase.instance.reference().child("users");
    _ref.push().set({'name':name,'password':pass,'type':type_int});
  }
  //-------------------------------
  String dropdownValue;
  var nameCont = TextEditingController();
  var passCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: Image.asset("img/car.png"),
          title: Text('Add Employee'),
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
                        hint:  Text("Select Type",style: TextStyle(color: Colors.white),),
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
                        },
                        items: <String>['Seller', 'Inventory', 'Admin']
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

                  RaisedButton(
                    onPressed: () {
                      if(nameCont.text=="" || passCont.text==""){
                        setState(() {
                          InvalidStatement="Please enter all fields!!";
                        });
                      }else{
                        addData(nameCont.text, passCont.text, dropdownValue);
                        setState(() {
                          nameCont.text = "";
                          passCont.text = "";
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
