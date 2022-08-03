import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.orange,
          title: Text(
            "PROFILE",
            style: TextStyle(
              fontSize: 30,
              fontFamily: "Poppins",
              color: Colors.black,
            ),
          ),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.person_outlined),
              color: Color.fromARGB(255, 27, 255, 2),
              iconSize: 150,
              onPressed: () {},
            ),
            Text(
              "YAA MONNE!!",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ],
        ));
  }
}
