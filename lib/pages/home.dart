import 'package:flutter/material.dart';
import '../Components/card.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';
import 'qrcode.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Product> l1 = [];
  var scanResult;
  var tot = 0;
  


    final _textController = TextEditingController();

    void itemRem() {
      setState(() {
        l1.removeLast();
      });
    }
  
  Widget eachProd(produ) {
    return Container(
      child: Card(
            child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text('${produ.name}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text('COST: ${produ.cost}'),
              ),
              trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            itemRem();
          },
        ),
            ),
          ),
    );
  }

  

  @override
  Widget build(BuildContext context) {

    Future scanBarCode() async {
      try{
        scanResult = await FlutterBarcodeScanner.scanBarcode("#ff6666","Cancel",true, ScanMode.BARCODE);
      } on PlatformException {
        scanResult = 'Failed to get platform version.';
      }
      if (!mounted) return;

      setState(() {
        this.scanResult = scanResult;
        var s = scanResult.split(" ");
        l1.insert(0, Product(name: s[0], cost: s[1]));
        tot = tot + int.parse(s[1]);
      });
    }

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
          children: [
            Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Item name',
              ),
            ),
          ),
            Expanded(
              child: ListView(
                children: l1.map((e) {
                  return eachProd(e);
                }).toList(),
              ),
            ),
            Container(
          width: 240.0,
          height: 42.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: const Color(0xff2c2c2c),
          ),
          child: Center(
            child: Text(
              'Total ${tot}',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 18,
                color: Colors.white,
                height: 1,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  textStyle: TextStyle(
                    fontSize: 30,
                  )
                  ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                                return qrcode(value: tot);
                            }),
                            );
              },
              child: const Text('Check Out'),
            ),
        )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           /* setState(() {
            l1.insert(0, Product(name: _textController.text));
            _textController.clear();
          });  */
          scanBarCode();
          setState(() {
            
            _textController.clear();
          });

        },
        backgroundColor: Colors.purple,
        child: Text("+",
        style: TextStyle(
          fontSize: 30.0
        ),
        ),
      ),
    );
  }
}