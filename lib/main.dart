import 'package:flutter/material.dart';
import 'package:riojas/route_generator.dart';

void main() => runApp(RiojasApp());

class RiojasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ruteo',
      initialRoute: "/",
      home: PageOne(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  } //Widget
} //RiojasApp

class PageOne extends StatelessWidget {
  String _params = "Saludos desde P1";
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  PageOne({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key al a scaffold para acceder al scaffold desde otro widget hijo
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Riojas Pagina 1'),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Container(
          child: MaterialButton(
            child: Text("Siguiente", style: TextStyle(fontSize: 16.0, color: Colors.white)),
            color: Colors.green[300],
            minWidth: 100.0,
            height: 35,
            onPressed: () {
              _openSecondPage(context);
            },
          ),
        ),
      ), //Body
    ); //Scaffold
  } //Widget

  void _openSecondPage(BuildContext context) async {
    String _datoRetornadoDeSecondPage;
    // await para esperar que se regrese dato desde la pantalla que se abre
    await Navigator.of(context)
        .pushNamed(
      "/secondPage",
      arguments: _params,
    )
        .then(
      (response) {
        _datoRetornadoDeSecondPage = response;
      },
    );

    // acceso al scaffold para mostrar snackbar
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          "Texto regresado: $_datoRetornadoDeSecondPage",
        ),
      ),
    );
  } //_openSecondPage
} //PageOne
