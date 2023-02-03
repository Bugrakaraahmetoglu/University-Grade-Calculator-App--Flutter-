import 'package:flutter/material.dart';
import 'package:ortalama_hesapla/model/dersler.dart';


class DataHelper{

static List<Ders> tumeklenendersler = [];

static dersEkle(Ders ders){
  tumeklenendersler.add(ders);
}

static double  ortalamaHesapla(){
  double toplamNot =0;
  double toplamKredi = 0;
  tumeklenendersler.forEach((element) { 
    toplamNot = toplamNot + (element.kredidegeri * element.harfdegeri);
    toplamKredi += element.kredidegeri;
    
  });

  return toplamNot/toplamKredi; 
}

  static List<String> _tumDerslerinHarfleri(){
    return ['AA',"BA","BB","CB","CC","DC","DD","FD","FF"];
  }

  static List<int> _tumderslerinkredileri(){
    return List.generate(10, (index) => index +1 ).toList();
  }

  static double _harfiNotaCevir(String harf ){
    switch(harf){
      case "AA":
      return 4;
      case "BA":
      return 3.5;
      case "BB":
      return 3;
      case "CB":
      return 2.5;
      case "CC":
      return 2;
      case "DC":
      return 1.5;
      case "DD":
      return 1;
      case "FD":
      return 0.5;
      case "FF":
      return 0.0;
      default:
      return 1;

    }
  }

  static List<DropdownMenuItem<double>> tumDerslerinHarfleri(){
    return _tumDerslerinHarfleri().map((e) => DropdownMenuItem(child: Text(e),value: _harfiNotaCevir(e),)).toList();
  }

  static List<DropdownMenuItem<double>> tumderslerinkredileri(){
    return _tumderslerinkredileri().map((e) => DropdownMenuItem(child: Text(e.toString()),
    value: e .toDouble(),
    ),
    ).toList();
  }
}