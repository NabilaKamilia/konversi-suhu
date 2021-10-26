//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  //TextEditingController etInput = new TextEditingController();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etInput = TextEditingController();

  double _inputUser = 0;

  double _kelvin = 0;

  double _reamur = 0;

  //final inputController = TextEditingController();

  konversi() {
    //set state
    setState(() {
      //inputUser = double.parse(etInput.text);
      //inputUser = double.parse(inputController.text);

      _inputUser = double.parse(etInput.text);
      _kelvin = _inputUser + 273;
      _reamur = (4 / 5) * _inputUser;
      // _farenheit = (9 / 5) * _inputUSer + 32;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Converte'),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //input(inputSuhu:inputSuhu),

              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: etInput,
                decoration: InputDecoration(hintText: 'Masukkan Nilai Suhu'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        'Suhu Dalam Kelvin',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        '$_kelvin',
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Suhu Dalam Reamor',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        '$_reamur',
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  onPressed: konversi,
                  color: Colors.lightBlue,
                  textColor: Colors.white,
                  child: Text('Konversi'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
