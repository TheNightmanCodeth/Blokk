import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Blokk'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const addChannel = MethodChannel('me.jdiggity.blokk/add');
  final addController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: addController,
              ),
            ),
            TextButton(
              child: const Text("Submit"),
              onPressed: () async {
                if (await _addToBlockList(addController.text)) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Success!!!"),
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Error):"),
                  ));
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _addToBlockList(String toAdd) async {
    bool toRet = false;
    try {
      final bool result =
          await addChannel.invokeMethod('addToBlockList', {'toAdd': toAdd});
      toRet = result;
    } on PlatformException catch (e) {
      print(e.message);
    }

    return toRet;
  }
}
