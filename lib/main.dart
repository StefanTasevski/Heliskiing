import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Heliskiing Tours',
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        secondaryHeaderColor: Colors.white,
        splashColor: Colors.black54
      ),
      initialRoute: '/',
      routes: {
          '/': (context) => HomePage(),
          '/webView': (context) {
            var split = ModalRoute.of(context).settings.arguments as List<String>;
            var name = split[1];
            return new WebviewScaffold(
            url: split[0],
            appBar: new AppBar(
              title: Text(name),
              backgroundColor: Colors.black54,
            ),
            withZoom: false,
            withLocalStorage: false,
          );
          }
      },
    );
  }
}