import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(121, 39, 187, 29),
          title: Text(
            'MARKYO',
            style: TextStyle(
              fontSize: 22.0,
              fontFamily: "Poppins",
              color: Color.fromARGB(255, 250, 246, 246),
            ),
          ),
        ),
        backgroundColor: Colors.grey.shade900,
        body: Center(
          child: Text("THANK YOU FOR THE PURCHASE :)",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30, fontFamily: "Poppins", color: Colors.white)),
        ),
      ),
    );
  }
}
