import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ortalama_hesapla/constants/app_constants.dart';
import 'package:ortalama_hesapla/helper/data_helper.dart';
import 'package:ortalama_hesapla/model/dersler.dart';

class DersListesi extends StatelessWidget {
  final Function onElemanCikarildi;
  const DersListesi({required this.onElemanCikarildi,super.key});

  @override
  Widget build(BuildContext context) {
    List<Ders> tumdersler = DataHelper.tumeklenendersler;
    return tumdersler.length > 0 ? ListView.builder(
      itemCount: tumdersler.length,itemBuilder: (context,index){
      return Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.startToEnd,
        onDismissed: (a){
        onElemanCikarildi(index);
        },
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Card(
            child: ListTile(
              title: Text(tumdersler[index].ad),
              leading: CircleAvatar(
                backgroundColor: Sabitler.anaRenk,
                child: Text((tumdersler[index].harfdegeri * tumdersler[index].kredidegeri).toStringAsFixed(0)),
              ),
              subtitle: Text("Kredi Değeri:${tumdersler[index].kredidegeri} Not Değeri: ${tumdersler[index].harfdegeri}"),
            ),
          ),
        ),
      );
    }): Container(
      child: Center(
        child: Text("Lütfen Ders Ekleyin",style: Sabitler.baslikstyle,),
        ),
      );
  }
}