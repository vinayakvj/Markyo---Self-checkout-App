import 'package:flutter/material.dart';
import '../Components/card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Product> l1 = [];

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
              title: Text('${produ.name}'),
              subtitle: Text('Rs.10'),
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
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            l1.insert(0, Product(name: _textController.text));
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