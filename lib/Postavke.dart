import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Postavke extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Postavke'),
        actions: <Widget>[
        IconButton(icon: Icon(Icons.check), color: Colors.white,
            onPressed: (){
              Navigator.pop(context);
            }
        )],),
      body:
        Column(

          children: [Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text('Igra do:' , textScaleFactor: 1.5,),
              ToggleSwitch(labels: ['1001', '701', '501'], minWidth: MediaQuery.of(context).size.width, initialLabelIndex: 0,),
              Divider(),
              Text('Aktivni profil:' , textScaleFactor: 1.5,),
              ToggleSwitch(labels: ['1','2','3','4','5'], minWidth: MediaQuery.of(context).size.width, ),
              Divider(),

            ],
          )],
        )
      ,
    );
  }
}