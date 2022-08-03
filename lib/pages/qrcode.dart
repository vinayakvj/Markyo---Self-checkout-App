import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class qrcode extends StatefulWidget {
  final value;

  const qrcode({Key? key ,this.value }) : super(key: key);


  @override
  State<qrcode> createState() => _qrcodeState();
}

class _qrcodeState extends State<qrcode> {
  @override
  Widget build(BuildContext context) {
    return (
      Scaffold(appBar: AppBar(
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
          child: Column(
            children: [
              Text('${widget.value}')
            ],
          ),
        ),)
      
    ));
  }
}