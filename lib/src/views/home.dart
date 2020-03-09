import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double n1,n2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Calculator'),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          child: Column(
            children: <Widget>[
              editTextNilai1(),
              editTextNilai2(),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  btnTambah(),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  btnKurang(),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  btnKali(),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  btnBagi()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget editTextNilai1(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Nilai 1'
      ),
    );
  }

  Widget editTextNilai2(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Nilai 2'
      ),
    );
  }

  Widget btnTambah(){
    return RaisedButton(
      onPressed: (){},
      child: Text('+', style: TextStyle(fontSize: 30.0),),
    );
  }
  
  Widget btnKurang(){
    return RaisedButton(
      onPressed: (){},
      child: Text('-', style: TextStyle(fontSize: 30.0),),
    );
  }

  Widget btnKali(){
    return RaisedButton(
      onPressed: (){},
      child: Text('x', style: TextStyle(fontSize: 30.0),),
    );
  }

  Widget btnBagi(){
    return RaisedButton(
      onPressed: (){},
      child: Text('/', style: TextStyle(fontSize: 30.0),),
    );
  }
}
