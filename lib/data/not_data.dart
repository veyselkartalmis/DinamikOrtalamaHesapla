// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:ortalama_hesapla/model/ders.dart';

class DataHelper {
  static List<Ders> tumEklenenDersler = [];

  static dersEkle(Ders ders) {
    tumEklenenDersler.add(ders);
  }

  //ORTALAMA HESAPLAMA FONKSİYONU
  static double ortalamaHesapla() {
    double toplamNot = 0;
    double toplamKredi = 0;
    tumEklenenDersler.forEach((element) {
      toplamNot = toplamNot + (element.krediDegeri * element.harfDegeri);
      toplamKredi += element.krediDegeri;
    });
    return toplamNot / toplamKredi;
  }

  static List<String> _dersHarfleri() {
    return ["AA", "BA", "BB", "CB", "CC", "DC", "DD", "FD", "FF"];
  }

  static double _harfiNotaCevir(String harf) {
    switch (harf) {
      case "AA":
        return 4;
      case "BA":
        return 3.5;
      case "BB":
        return 3.0;
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

  static List<DropdownMenuItem<double>> dersHarfleri() {
    return _dersHarfleri()
        .map(
          (harfim) => DropdownMenuItem(
            child: Text(harfim),
            value: _harfiNotaCevir(harfim),
          ),
        )
        .toList();
  }

  //KREDİLER İÇİN
  static List<int> _krediler() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> kredileriYaz() {
    return _krediler()
        .map(
          (kredi) => DropdownMenuItem(
            child: Text(kredi.toString()),
            value: kredi.toDouble(),
          ),
        )
        .toList();
  }
}
