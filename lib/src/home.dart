import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './mixins/validation.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with Validation{
  double nilai1,nilai2,hasil;
  String jumlah = 'Hasil = 0';
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Calculator'),
      ),

      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              editTextNilai1(),
              editTextNilai2(),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  btnTambah(),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  btnKurang(),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  btnKali(),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  btnBagi(),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Card(
                elevation: 10.0,
                color: Colors.blue,
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  child: Text(jumlah, style: TextStyle(fontSize: 30.0, color: Colors.white, fontWeight: FontWeight.bold),),
                )
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget editTextNilai1() {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        labelText: 'Nilai 1'
      ),
      validator: validateNilai1,
      onSaved: (value){
        nilai1 = double.parse(value);
      },
    );
  }

  Widget editTextNilai2() {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        labelText: 'Nilai 2'
      ),
      validator: validateNilai2,
      onSaved: (value){
        nilai2 = double.parse(value);
      },
    );
  }

  Widget btnTambah() {
    return RaisedButton(
      color: Colors.blue,
      elevation: 10.0,
      child: Text('+',style: TextStyle(fontSize: 30.0, color: Colors.white),),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          setState(() {
            hasil = nilai1 + nilai2;
            jumlah = 'Hasil = $hasil';
          });
        }
      },
    );
  }

  Widget btnKurang() {
    return RaisedButton(
      color: Colors.blue,
      elevation: 10.0,
      child: Text('-',style: TextStyle(fontSize: 30.0, color: Colors.white),),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          setState(() {
            hasil = nilai1 - nilai2;
            jumlah = 'Hasil = $hasil';
          });
        }
      },
    );
  }

  Widget btnKali() {
    return RaisedButton(
      color: Colors.blue,
      elevation: 10.0,
      child: Text('x',style: TextStyle(fontSize: 30.0, color: Colors.white),),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          setState(() {
            hasil = nilai1 * nilai2;
            jumlah = 'Hasil = $hasil';
          });
        }
      },
    );
  }

  Widget btnBagi() {
    return RaisedButton(
      color: Colors.blue,
      elevation: 10.0,
      child: Text('/',style: TextStyle(fontSize: 30.0, color: Colors.white),),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          setState(() {
            hasil = nilai1 / nilai2;
            jumlah = 'Hasil = $hasil';
          });
        }
      },
    );
  }
}