import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.menu_outlined,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          // add more IconButton
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

          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.person_outlined),
              color: Colors.black,
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: Colors.grey.shade900,
        body: ListView(
          children: [
            Text(
              "SHOP AND PAY BILL ON YOUR PHONE!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontFamily: "Poppins",
                color: Colors.white,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 100),
                  IconButton(
                    onPressed: () {},
                    color: Colors.white,
                    splashColor: Color.fromARGB(121, 39, 187, 29),
                    icon: Icon(Icons.qr_code_scanner),
                    iconSize: 28,
                  ),
                  SizedBox(height: 100),
                  IconButton(
                    onPressed: () {},
                    color: Colors.white,
                    splashColor: Color.fromARGB(121, 39, 187, 29),
                    icon: Icon(Icons.shopping_cart_outlined),
                    iconSize: 28,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
