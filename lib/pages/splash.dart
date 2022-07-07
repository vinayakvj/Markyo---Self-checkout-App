import 'package:flutter/material.dart';
import './login.dart';


class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async{
     await Future.delayed(Duration(milliseconds: 1500), () {});
     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
              return LoginPage();
            }),); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('Markyo',
          style: TextStyle(
            fontSize: 50.0,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
            letterSpacing: 2.0
          ),),
        ),
        ),
    );
  }
}