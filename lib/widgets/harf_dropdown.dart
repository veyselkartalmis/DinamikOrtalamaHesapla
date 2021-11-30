// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ortalama_hesapla/constants/app_constants.dart';
import 'package:ortalama_hesapla/data/not_data.dart';

class HarfDropDown extends StatefulWidget {
  final Function harfSecildi;
  HarfDropDown({required this.harfSecildi, Key? key}) : super(key: key);

  @override
  _HarfDropDownState createState() => _HarfDropDownState();
}

class _HarfDropDownState extends State<HarfDropDown> {
  double secilenHarfDeger = 4.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Constants.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Constants.borderRadius,
      ),
      child: DropdownButton<double>(
        value: secilenHarfDeger,
        onChanged: (deger) {
          setState(() {
            secilenHarfDeger = deger!;
            widget.harfSecildi(secilenHarfDeger);
          });
        },
        elevation: 16,
        iconEnabledColor: Constants.anaRenk,
        underline: Container(),
        items: DataHelper.dersHarfleri(),
      ),
    );
  }
}
