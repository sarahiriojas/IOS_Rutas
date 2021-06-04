import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String texto;
  TextEditingController _textController = TextEditingController();

  SecondPage({Key key, this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Riojas Pagina 2"),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _textController,
                maxLength: 10,
                decoration: InputDecoration(
                  labelText: "Escribe alguna palabra",
                  hintText: "Palabra",
                ),
              ),
            ),
            MaterialButton(
              child: Text("Volver", style: TextStyle(fontSize: 16.0, color: Colors.white)),
              minWidth: 100.0,
              height: 35,
              color: Colors.green[300],
              onPressed: () {
                Navigator.of(context).pop(_textController.text);
              },
            ), //Material Button
          ], //Widget
        ), //Columna
      ), //Body
    ); //Scaffold
  } //Widget
} //Segunda Pagina
