import 'package:flutter/material.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
  );
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      home: Scaffold(
        appBar: AppBar(
          // add more IconButton
          centerTitle: true,
          backgroundColor: Colors.orange,
          title: Text(
            'MARKYO',
            style: TextStyle(
              fontSize: 30,
              fontFamily: "Poppins",
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),

          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.person_outlined),
              color: Colors.black,
              iconSize: 35,
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: Colors.grey.shade900,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/shop.jpg'),
                  fit: BoxFit.cover,
                  alignment: Alignment.center)),
          child: ListView(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 200),
                    IconButton(
                      onPressed: () {},
                      padding: EdgeInsets.only(left: 270, top: 125),
                      color: Colors.orange,
                      splashColor: Colors.orange,
                      icon: Icon(Icons.qr_code_scanner),
                      iconSize: 70,
                    ),
                    SizedBox(height: 100),
                    IconButton(
                      padding: EdgeInsets.only(left: 270),
                      onPressed: () {},
                      color: Colors.orange,
                      splashColor: Colors.orange,
                      icon: Icon(Icons.shopping_cart_outlined),
                      iconSize: 70,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
