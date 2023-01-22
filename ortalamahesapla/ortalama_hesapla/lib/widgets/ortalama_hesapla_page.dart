import 'package:flutter/material.dart';
import 'package:ortalama_hesapla/constants/app_constants.dart';
import 'package:ortalama_hesapla/helper/data_helper.dart';
import 'package:ortalama_hesapla/model/dersler.dart';
import 'package:ortalama_hesapla/widgets/ders_listesi.dart';
import 'package:ortalama_hesapla/widgets/ortalama_goster.dart';



class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {

final formKey = GlobalKey<FormState>();
 double secilenharfdegeri = 4;
 double secilenkredidegeri = 1;
 String girilendersadi = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(child: Text(Sabitler.baslikText,
        style: Sabitler.baslikstyle,
        ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child:_builForm(),),
           Expanded(
             flex: 1,
             child: OrtalamaGoster(
               dersSayisi: DataHelper.tumeklenendersler.length, 
               ortalama: DataHelper.ortalamaHesapla()
               ),
           )
          ],
        ),
           Expanded(
             child: DersListesi(
               onElemanCikarildi:(index){
                 DataHelper.tumeklenendersler.removeAt(index);
                setState(() {
                  
                });
               },
             ),
           )
        ],
      )
    );
  }
  
  _builForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: Sabitler.yatayPadding8,
             child: _buildTextFormField(),),
        
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(padding:EdgeInsets.symmetric(horizontal: 8 ,vertical:8 ), child: _buildHarfler(),)),
             Expanded(
               child: Padding(padding:EdgeInsets.symmetric(horizontal: 8,vertical: 8), child: _buildKrediler(),)),
              IconButton(onPressed: _dersEkleeOrtalamaHesapla, icon: Icon(Icons.arrow_forward_ios_sharp),
              color: Sabitler.anaRenk,
              iconSize: 30,),


            ],
          )
        ],
      ),
    );
  }
  _buildTextFormField() {
    return TextFormField(
      onSaved: (deger){
        setState(() {
          girilendersadi = deger!;
        });
      },
      validator:(s){
        if(s!.length <=0){
          return "Ders Adı Giriniz";
        } else
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Matematik',
        border: OutlineInputBorder(
          borderRadius: Sabitler.borderRadius,
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Sabitler.anaRenk.shade100.withOpacity(0.3)
      ),
    );
  }
  
  _buildHarfler() {
   
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
        value: secilenharfdegeri,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk,
        onChanged: (deger){
          setState(() {
            secilenharfdegeri = deger!;
            
          });
          
        },
        underline: Container(),
        items: DataHelper.tumDerslerinHarfleri(),
      ),
      );
    
  }

   _buildKrediler() {
   
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius),
        child: DropdownButton<double>(
        value: secilenkredidegeri,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk,
        onChanged: (deger){
          setState(() {
            secilenkredidegeri = deger!;
            
          });
          
        },
        underline: Container(),
        items: DataHelper.tumderslerinkredileri(),
      ),
      );
    
  }
  

  void _dersEkleeOrtalamaHesapla() {
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
      var eklenecekders = Ders(
        ad:girilendersadi, 
        harfdegeri: secilenharfdegeri, 
        kredidegeri: secilenkredidegeri);
        DataHelper.dersEkle(eklenecekders);
        setState(() {
          
        });
    }
  }
}