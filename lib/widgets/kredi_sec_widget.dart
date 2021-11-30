// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ortalama_hesapla/constants/app_constants.dart';
import 'package:ortalama_hesapla/data/not_data.dart';

class KrediSecWidget extends StatefulWidget {
  final Function krediGonder;
  KrediSecWidget({required this.krediGonder, Key? key}) : super(key: key);

  @override
  _KrediSecWidgetState createState() => _KrediSecWidgetState();
}

class _KrediSecWidgetState extends State<KrediSecWidget> {
  double secilenKredi = 1;
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
        value: secilenKredi,
        onChanged: (deger) {
          setState(() {
            secilenKredi = deger!;
            widget.krediGonder(secilenKredi);
          });
        },
        elevation: 16,
        iconEnabledColor: Constants.anaRenk,
        underline: Container(),
        items: DataHelper.kredileriYaz(),
      ),
    );
  }
}
