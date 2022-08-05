import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qr_flutter/qr_flutter.dart';

class qrcode extends StatefulWidget {
  final value;

  const qrcode({Key? key, this.value}) : super(key: key);

  @override
  State<qrcode> createState() => _qrcodeState();
}

class _qrcodeState extends State<qrcode> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'MARKYO',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                color: Colors.black),
          ),
          backgroundColor: Colors.orange,
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: QrImage(
                    data: widget.value.toString(),
                    size: 200,
                  ),
                ),
                Text('Total amt: ${widget.value}'),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    "SCAN TO PAY.",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        )));
  }
}
