import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:layout/Runda.dart';
class Partija  extends StatelessWidget{
  int ukupnoMi=0;
  int ukupnoVi=0;
  List<Runda> runde=new List();
  @override
  Widget build(BuildContext context){
    return new Scaffold();
  }

  Partija(){

  }

  void NovaRunda(int Mi, int Vi, int MiZvanja, int ViZvanja, bool stiglja){
    Runda novaRunda=new Runda();
    ukupnoMi=0;
    ukupnoVi=0;
    novaRunda.mi=Mi;
    novaRunda.vi=Vi;
    novaRunda.miZvanja=MiZvanja;
    novaRunda.viZvanja=ViZvanja;
    novaRunda.miUk=Mi+MiZvanja;
    novaRunda.viUk=Vi+ViZvanja;
    novaRunda.stiglja=stiglja;
    runde.add(novaRunda);
    runde.forEach((element) {
      ukupnoMi=ukupnoMi+element.mi+element.miZvanja;
      ukupnoVi=ukupnoVi+element.vi+element.viZvanja;
    });
  }

}