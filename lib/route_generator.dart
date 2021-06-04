import 'package:riojas/main.dart';
import 'package:riojas/second_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => PageOne(),
        );
      case "/secondPage":
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => SecondPage(
              texto: args,
            ),
          );
        } else
          return _errorPage();
        break;
      default:
        return _errorPage();
    } //Switch
  } //Lista Route Dinamico

  static Route<dynamic> _errorPage() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text("Error"),
        ),
        body: Center(
          child: Text("Error page"),
        ),
      ),
    );
  } //Dinamica
} //RouteGenerator
