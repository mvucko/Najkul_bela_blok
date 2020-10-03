import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:layout/partija.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Unos extends StatelessWidget{
  Partija trenutna=new Partija();
  Unos(Partija){
    trenutna=Partija;
    miTxt.text='0';
    viTxt.text='0';
    miZvanjeTxt.text='0';
    viZvanjeTxt.text='0';
  }
  TextEditingController miTxt=TextEditingController();
  TextEditingController viTxt=TextEditingController();
  TextEditingController miZvanjeTxt=TextEditingController();
  TextEditingController viZvanjeTxt=TextEditingController();

  int aktivna=0;
  bool mod=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rezultat dijeljenja'),
      ),

      floatingActionButton: FloatingActionButton(onPressed:(){
        upisiRundu();

        Navigator.pop(context);
      },
          child: Icon(Icons.check)),

      body: Column(
        children: [Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Expanded(
            //width: 100, // do it in both Container
              child: TextField(

                controller: miZvanjeTxt,
                onTap: (){
                  aktivna=1;

                },
                readOnly: true,
                decoration: null,

                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  // FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                style: TextStyle(
                  fontSize: 15,),
                textAlign: TextAlign.left,)),
            Expanded(
            //width: 100, // do it in both Container
            child: TextField(

              controller: miTxt,
              onTap: (){
                aktivna=1;

              },
              readOnly: true,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
               // FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              style: TextStyle(
              fontSize: 30,),
              textAlign: TextAlign.right,)),
        Text('  :  ', textScaleFactor: 2,),
            Expanded(
              //width: 100, // do it in both Container
                child: TextField(

                  onTap: (){
                    aktivna=2;
                  },

                  readOnly: true,
                  controller: viTxt,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  style: TextStyle(
                    fontSize: 30,),
                  textAlign: TextAlign.left,)),

            Expanded(
              //width: 100, // do it in both Container
                child: TextField(

                  controller: viZvanjeTxt,
                  onTap: (){
                    aktivna=1;

                  },
                  readOnly: true,
                  decoration: null,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    // FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  style: TextStyle(
                    fontSize: 15,),
                  textAlign: TextAlign.right,)),],
        )

        ,
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ToggleSwitch(labels: ['Igra', 'Zvanje'], initialLabelIndex: 0, fontSize: 20, minWidth: MediaQuery.of(context).size.width, onToggle: (index){
              if(index==0) mod=false;
              else mod=true;
            },)
          ],
          )
          ,
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
            children: [
              FlatButton(onPressed: (){dodajRez(7);}, child: Text('7', textScaleFactor: 3,)),
              FlatButton(onPressed: (){dodajRez(8);}, child: Text('8', textScaleFactor: 3,)),
              FlatButton(onPressed: (){dodajRez(9);}, child: Text('9', textScaleFactor: 3,))]),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
            children: [
              FlatButton(onPressed: (){dodajRez(4);}, child: Text('4', textScaleFactor: 3,)),
              FlatButton(onPressed: (){dodajRez(5);}, child: Text('5', textScaleFactor: 3,)),
              FlatButton(onPressed: (){dodajRez(6);}, child: Text('6', textScaleFactor: 3,))]),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
            children: [
              FlatButton(onPressed: (){dodajRez(1);}, child: Text('1', textScaleFactor: 3,)),
              FlatButton(onPressed: (){dodajRez(2);}, child: Text('2', textScaleFactor: 3,)),
              FlatButton(onPressed: (){dodajRez(3);}, child: Text('3', textScaleFactor: 3,))]),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
          children: [
            FlatButton(onPressed: (){dodajRez(0);}, child: Text('0', textScaleFactor: 3,)),
            FlatButton(onPressed: (){dodajRez(-1);}, child: Icon(Icons.backspace)),
            FlatButton(onPressed: (){dodajRez(-2);}, child: Icon(Icons.autorenew))],

        ), Divider(),
          Row(children: [Text('Zvanja:',textScaleFactor: 2,)]),
          Divider(),

        ]

      ),

    );
  }

  void dodajRez(int num) {
    int mi=int.tryParse(miTxt.text);
    int vi=int.tryParse(viTxt.text);
    int miZvanje=int.tryParse(miZvanjeTxt.text);
    int viZvanje=int.tryParse(viZvanjeTxt.text);
    if (!mod) {
      if (aktivna == 1 && num >= 0) {
        mi = mi * 10 + num;
        if (mi > 162) mi = (mi / 10).floor();
      }
      if (aktivna == 1 && num == -1) {
        mi = (mi / 10).floor();
      }
      if (aktivna == 1) {
        vi = 162 - mi;
      }

      if (aktivna == 2 && num >= 0) {
        vi = vi * 10 + num;
        if (vi > 162) vi = (vi / 10).floor();
      }
      if (aktivna == 2 && num == -1) {
        vi = (vi / 10).floor();
      }
      if (aktivna == 2) {
        mi = 162 - vi;
      }
      miTxt.text = mi.toString();
      viTxt.text = vi.toString();
    }
    else{
      if (aktivna == 1 && num >= 0) {
        miZvanje = miZvanje * 10 + num;

      }
      if (aktivna == 1 && num == -1) {
        miZvanje = (miZvanje/ 10).floor();
      }

      if (aktivna == 2 && num >= 0) {
        viZvanje = viZvanje * 10 + num;

      }
      if (aktivna == 2 && num == -1) {
        viZvanje = (viZvanje / 10).floor();
      }

      miZvanjeTxt.text = miZvanje.toString();
      viZvanjeTxt.text = viZvanje.toString();
    }

  }

  void upisiRundu(){
    int mi=int.tryParse(miTxt.text);
    int vi=int.tryParse(viTxt.text);
    int viZvanje=int.tryParse(viZvanjeTxt.text);
    int miZvanje=int.tryParse(miZvanjeTxt.text);
    trenutna.NovaRunda(mi, vi, miZvanje, viZvanje, false);
  }
}