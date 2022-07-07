import 'package:flutter/material.dart';
import 'home.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {

  final _textController1 = TextEditingController();
  final _textController2 = TextEditingController();

  String firstName = '';
  String secondName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Markyo',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
        ),
      ),
        backgroundColor: Color.fromARGB(255, 158, 1, 185),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
            margin: EdgeInsets.only(top: 0),
            padding: EdgeInsets.only(left: 35,right: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Sign Up' ,
                style: TextStyle(
                  fontSize: 20.0
                ),
              ),
                Container(
                  padding: EdgeInsets.only(top: 20.0,bottom: 20.0),
                  child: TextField(
                    controller: _textController1,
                    decoration: InputDecoration(
                      hintText: 'Username'
                    ),
                  ),
                ),
                TextField(
                  controller: _textController2,
                  decoration: InputDecoration(
                    hintText: 'Password'
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20.0,bottom: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'email'
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 0,bottom: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'phone Number'
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 40.0),
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        firstName = _textController1.text;
                        secondName = _textController2.text;
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                          return Home();
                          }),);
                      });
                    },
                    child: Text('Sign Up'),
                  ),
                ),
              ],
            ),
          )
        ), 
      floatingActionButton: FloatingActionButton(
        child: Text('clear'),
        onPressed: () {
          setState(() {
            firstName = '';
            secondName = '';

             /* Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
              return Home();
            }),); */ 
          });
        },
        backgroundColor: Color.fromARGB(255, 158, 1, 185),
      ),
      );
  }
}