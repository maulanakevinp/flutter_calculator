import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      home: FormCalculator(),
    );
  }
}

class FormCalculator extends StatefulWidget {
  @override
  _FormCalculatorState createState() => _FormCalculatorState();
}

class _FormCalculatorState extends State<FormCalculator> {
  final _formKey = GlobalKey<FormState>();
  double nilai1 = 0, nilai2 = 0, hasil = 0;
  String jumlah = '';

  void tambah(double n1, double n2) {
    setState(() {
      hasil = n1 + n2;
      jumlah = 'Hasil = $hasil';
    });
  }
  void kurang(double n1, double n2) {
    setState(() {
      hasil = n1 - n2;
      jumlah = 'Hasil = $hasil';
    });
  }
  void bagi(double n1, double n2) {
    setState(() {
      hasil = n1 / n2;
      jumlah = 'Hasil = $hasil';
    });
  }
  void kali(double n1, double n2) {
    setState(() {
      hasil = n1 * n2;
      jumlah = 'Hasil = $hasil';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Calculator'),
      ),

      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: 'Nilai 1'
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Nilai 1 tidak boleh kosong';
                  }
                  return null;
                },
                onSaved: (value) {
                  nilai1 = double.parse(value);
                },
              ),
              
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: 'Nilai 2'
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Nilai 2 tidak boleh kosong';
                  }
                  return null;
                },
                onSaved: (value) {
                  nilai2 = double.parse(value);
                },
              ),

              Padding(padding: EdgeInsets.only(top: 10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text('+',style: TextStyle(fontSize: 30.0),),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        tambah(nilai1,nilai2);
                      }
                    },
                  ),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  RaisedButton(
                    child: Text('-',style: TextStyle(fontSize: 30.0),),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        kurang(nilai1,nilai2);
                      }
                    },
                  ),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  RaisedButton(
                    child: Text('x',style: TextStyle(fontSize: 30.0),),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        kali(nilai1,nilai2);
                      }
                    },
                  ),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  RaisedButton(
                    child: Text('/',style: TextStyle(fontSize: 30.0),),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        bagi(nilai1,nilai2);
                      }
                    },
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Text(jumlah, style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }
}


