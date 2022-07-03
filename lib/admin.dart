
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:ultramarket/listEmp.dart';
import 'package:ultramarket/searchEmp.dart';
import 'package:ultramarket/updateEmp.dart';
import 'addEmp.dart';
import 'delEmp.dart';


class admin extends StatefulWidget {
  String name;
  admin(String this.name);
  @override
  _adminState createState() => _adminState(name);
}

class _adminState extends State<admin> {
    String name;
  _adminState(String this.name);

    //navigator Functions for all accessableity
    void _navigateToScreenAddEmp(BuildContext context) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => addEmp()));
    }
    void _navigateToScreenSearchEmp(BuildContext context) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => searchEmp()));
    }
    void _navigateToScreenListEmp(BuildContext context) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => listEmp()));
    }
    void _navigateToScreenDelEmp(BuildContext context) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => delEmp()));
    }
    void _navigateToScreenUpdateEmp(BuildContext context) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => updateEmp()));
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
                child: Text("Admin Field",style: TextStyle(color: Colors.white),),
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
                        _navigateToScreenAddEmp(context);
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
                        _navigateToScreenDelEmp(context);
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
                        _navigateToScreenUpdateEmp(context);
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
                        _navigateToScreenSearchEmp(context);
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
                        _navigateToScreenListEmp(context);
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => addEmp()));
                }),
                IconButton(icon: Icon(Icons.search,color: Colors.white), onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => searchEmp()));
                }),
                IconButton(icon: Icon(Icons.delete,color: Colors.white), onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => delEmp()));
                }),
                IconButton(icon: Icon(Icons.edit,color: Colors.white), onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => updateEmp()));
                }),
                IconButton(icon: Icon(Icons.list,color: Colors.white), onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => listEmp()));
                }),
              ]
          )
      ),
    );
  }
}
