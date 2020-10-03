import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:layout/partija.dart';

import 'Unos.dart';
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




class Awidget extends StatefulWidget {

  @override
  _AwidgetState createState() => _AwidgetState();
}

class _AwidgetState extends State<Awidget> {
  Partija partija=new Partija();

  int _ukupnoMi=162;

  int _ukupnoVi=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(icon: Icon(Icons.settings), color: Colors.white,
                onPressed: (){

                }
                )],),
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
                    Expanded(child: Text(partija.ukupnoMi.toString(), textAlign: TextAlign.center, textScaleFactor: 2.5)),
                    Expanded(child: Text(partija.ukupnoVi.toString(), textAlign: TextAlign.center, textScaleFactor: 2.5,))
                  ]
              )]
            ),
              Flexible(child: ListView.separated (
                padding: const EdgeInsets.all(8),
                itemCount:partija.runde.length,
                itemBuilder: (BuildContext context, int index){
                  return Container(
                    height: 50,
                    color: Colors.cyan[200],
                    child: Row(
                      children: <Widget> [
                        Expanded(child: Text(partija.runde[index].miUk.toString(), textScaleFactor: 1.5)),
                        Expanded(child: Text(partija.runde[index].viUk.toString(), textScaleFactor: 1.5, textAlign: TextAlign.right,))
                      ],
                    )

                  );
                },
                separatorBuilder: (BuildContext context, int index) => const Divider(),
              )),

            ]
        ),
        floatingActionButton: FloatingActionButton(onPressed:(){

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Unos(partija))).then((value) => setState(() {
            // refresh state of Page1
          }) );
          (context as Element).reassemble();

        } ,child: Icon(Icons.add))
    );
  }
}
