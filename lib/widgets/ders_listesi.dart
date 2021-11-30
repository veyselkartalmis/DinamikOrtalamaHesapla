// ignore_for_file: prefer_is_empty, prefer_const_constructors, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:ortalama_hesapla/constants/app_constants.dart';
import 'package:ortalama_hesapla/data/not_data.dart';
import 'package:ortalama_hesapla/model/ders.dart';

class DersListesi extends StatefulWidget {
  final Function elemanCikar;
  const DersListesi({required this.elemanCikar, Key? key}) : super(key: key);

  @override
  State<DersListesi> createState() => _DersListesiState();
}

class _DersListesiState extends State<DersListesi> {
  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;
    return tumDersler.length > 0
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (contex, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (a) {
                  widget.elemanCikar(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(tumDersler[index].ad),
                      subtitle: Text("Ders Notu: " +
                          (tumDersler[index].harfDegeri).toString() +
                          " Kredi: " +
                          (tumDersler[index].krediDegeri).toString()),
                      leading: CircleAvatar(
                        backgroundColor: Constants.anaRenk,
                        child: Text((tumDersler[index].harfDegeri *
                                tumDersler[index].krediDegeri)
                            .toStringAsFixed(0)),
                      ),
                    ),
                  ),
                ),
              );
            })
        : Container(
            child: Center(
                child: Text(
              "Lütfen Ders Ekleyin",
              style: Constants.baslikStyle,
            )),
          );
  }
}
