import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import './Components/card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Product> l1 = [
    Product(name:'Chips', cost:10),
    Product(name:'Bread',cost:20),
    ];

  
  Widget eachProd(prod) {
    return Container(
      child: Card(
        color: Colors.purple[50],
        shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('${prod.name}',
              style: TextStyle(
                fontSize: 30.0
              ),),
              Text('Rs.${prod.cost}',
              style: TextStyle(
                fontSize: 20.0
              ),)
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 158, 1, 185),
        title: Text('Markyo',
        style: TextStyle(
          letterSpacing: 2.0,
          fontWeight: FontWeight.bold
        ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column( 
          children: l1.map((e) {
            return eachProd(e);
          }).toList()
        ),
      ),
    );
  }
}