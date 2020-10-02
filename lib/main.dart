import 'package:flutter/material.dart';
// Uncomment lines 7 and 10 to view the visual layout at runtime.
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  // debugPaintSizeEnabled = true;
  runApp(Entrypoint());
}

class Entrypoint extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TestApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Awidget(),
    );
  }
}




class Awidget extends StatelessWidget {

  int _ukupnoMi=162;
  int _ukupnoVi=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Column(
              children: [Row(
                children: <Widget> [
                  Expanded(child: Text('Mi', textAlign: TextAlign.center)),
                  Expanded(child: Text('Vi', textAlign: TextAlign.center))
                ]
              ), Row(
                  children: <Widget> [
                    Expanded(child: Text(_ukupnoMi.toString(), textAlign: TextAlign.center, textScaleFactor: 2)),
                    Expanded(child: Text(_ukupnoVi.toString(), textAlign: TextAlign.center, textScaleFactor: 2,))
                  ]
              )]
            ),
              Flexible(child: ListView ( padding: const EdgeInsets.all(8), children: <Widget> [Container(color: Colors.blue, height: 60)],))
            ]
        )
    );
  }
}
