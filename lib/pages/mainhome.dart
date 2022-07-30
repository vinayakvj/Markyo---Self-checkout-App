import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class mainhome extends StatefulWidget {
  const mainhome({Key? key}) : super(key: key);

  @override
  State<mainhome> createState() => _mainhomeState();
}

class _mainhomeState extends State<mainhome> {
  String? scanResult;

  @override
  Widget build(BuildContext context) {

    Future scanBarCode() async {
      String scanResult;
      try{
        scanResult = await FlutterBarcodeScanner.scanBarcode("#ff6666","Cancel",true, ScanMode.BARCODE);
      } on PlatformException {
        scanResult = 'Failed to get platform version.';
      }
      if (!mounted) return;

      setState(() {
        this.scanResult = scanResult;
      });
    }
    
    return(
      Scaffold(
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
          children: [
            ElevatedButton(
  onPressed: scanBarCode,
  child: Text('SCAN'),
),
      Text(scanResult == null? 'scan a code':'scan Result : $scanResult',
          style: TextStyle(
            fontSize: 20,
          ),)
          ],
        )
      ),
      )
    );

    
  }
}