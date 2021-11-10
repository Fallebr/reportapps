import 'package:flutter/material.dart';
import 'package:reportapps/models/kode_model.dart';
import 'package:reportapps/pages/add.dart';

class Employee extends StatelessWidget {
  final List data = [
    KodeModel(
        kode: "11-05",
        pemasukan: "500000",
        pengeluaran: "120000",
        pendapatan: "380000",
        dateImage: ""),
    KodeModel(
        kode: "11-06",
        pemasukan: "400000",
        pengeluaran: "100000",
        pendapatan: "300000",
        dateImage: ""),
    KodeModel(
        kode: "11-07",
        pemasukan: "100000",
        pengeluaran: "30000",
        pendapatan: "70000",
        dateImage: ""),
    KodeModel(
        kode: "11-08",
        pemasukan: "300000",
        pengeluaran: "50000",
        pendapatan: "250000",
        dateImage: ""),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('KOPI LETEK DAILY REPORT'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        child: Text('+'),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Add()));
        },
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, i) {
            return Card(
              elevation: 8,
              child: ListTile(
                title: Text(
                  data[i].kode,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text('pemasukan  : \RP.${data[i].pemasukan}'
                    '                             ' //spacing
                    'pengeluaran : \RP.${data[i].pengeluaran}'),
                trailing: Text("\RP.${data[i].pendapatan}"),
              ),
            );
          },
        ),
      ),
    );
  }
}
