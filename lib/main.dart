import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ultramarket/splash.dart';
import 'package:ultramarket/variables.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: splash() ,
  ),
  );
}


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _passwordVisible = false;
  Query _ref;
  @override
  void initState() {
    //retrieve();
    super.initState();
    _ref=FirebaseDatabase.instance.reference().child("Users");

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: Image.asset("img/car.png"),
          title: Text('Login'),
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
                      obscureText: !_passwordVisible,
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
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColorLight,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),//pass

                  RaisedButton(
                    onPressed: () {
                        if(nameCont.text=="" || passCont.text==""){
                          setState(() {
                            InvalidStatement="Please enter all fields!!";
                          });
                        }else{
                          CheckUsers(nameCont.text, passCont.text,context);
                          setState(() {
                            nameCont.text="";
                            passCont.text="";
                          });
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
                      const Text('Login', style: TextStyle(fontSize: 20)),
                    ),
                  ),
                  Text(InvalidStatement,style: TextStyle(color: Colors.red),),

                ],
              ),
            ),
          ),
        ),
      ),
      ),
    );
  }
}
