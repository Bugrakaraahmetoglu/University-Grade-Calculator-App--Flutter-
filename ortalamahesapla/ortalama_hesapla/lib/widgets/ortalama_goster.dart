

import 'package:flutter/material.dart';
import 'package:ortalama_hesapla/constants/app_constants.dart';

class OrtalamaGoster extends StatelessWidget {

final double ortalama;
final int dersSayisi;

  const OrtalamaGoster({required this.dersSayisi,required this.ortalama ,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dersSayisi > 0 ? '$dersSayisi Ders Girildi' : 'Ders Seçiniz',
          style: Sabitler.OrtalamaGosterBodyStyle,
        ),
        Text(ortalama >=0 ? '${ortalama.toStringAsFixed(2)}': '0.0',style: Sabitler.ortalamastyle,),
        Text("Ortalama",style: Sabitler.OrtalamaGosterBodyStyle),
      ],
    );
  }
}