import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double nilai1,nilai2,hasil;
  String jumlah = '';
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
              Text(jumlah, style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),)
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
      validator: (value) {
        if (value.isEmpty) {
          return 'Harap isi nilai 1';
        }
        return null;
      },
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
      validator: (value) {
        if (value.isEmpty) {
          return 'Harap isi nilai 2';
        }
        return null;
      },
      onSaved: (value){
        nilai2 = double.parse(value);
      },
    );
  }

  Widget btnTambah() {
    return RaisedButton(
      child: Text('+',style: TextStyle(fontSize: 30.0),),
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
      child: Text('-',style: TextStyle(fontSize: 30.0),),
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
      child: Text('x',style: TextStyle(fontSize: 30.0),),
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
      child: Text('/',style: TextStyle(fontSize: 30.0),),
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