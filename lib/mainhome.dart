//barcode//
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Mainhome extends StatefulWidget {
  const Mainhome({Key? key}) : super(key: key);

  @override
  State<Mainhome> createState() => _MainhomeState();
}

class _MainhomeState extends State<Mainhome> {
  String? scanResult;

  @override
  Widget build(BuildContext context) {
    Future scanBarCode() async {
      String scanResult;
      try {
        scanResult = await FlutterBarcodeScanner.scanBarcode(
            "#ff6666", "Cancel", true, ScanMode.BARCODE);
      } on PlatformException {
        scanResult = 'Failed to get platform version.';
      }
      if (!mounted) return;

      setState(() {
        this.scanResult = scanResult;
      });
    }

    return (Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'MARKYO',
          style: TextStyle(
            fontSize: 30,
            fontFamily: "Poppins",
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              child: Text(
                "SCAN",
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
              onPressed: scanBarCode,
            ),
          ),
          Text(
            scanResult == null ? 'Scan a code' : 'Scan Result : $scanResult',
            style: TextStyle(fontSize: 20, color: Colors.grey.shade400),
          )
        ],
      ),
    ));
  }
}
