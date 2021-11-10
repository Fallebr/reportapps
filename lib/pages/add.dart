import 'package:flutter/material.dart';

class Add extends StatelessWidget {
  final TextEditingController _kode = TextEditingController();
  final TextEditingController _pemasukan = TextEditingController();
  final TextEditingController _pengeluaran = TextEditingController();

  void submit() {
    print(_kode.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text('Add data'),
          actions: <Widget>[
            FlatButton(
              child: Icon(
                Icons.save,
                color: Colors.white,
              ),
              onPressed: submit,
            )
          ],
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              TextField(
                controller: _kode,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.pinkAccent,
                    ),
                  ),
                  hintText: 'Kode Hari',
                ),
              ),
              TextField(
                controller: _pemasukan,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.pinkAccent,
                    ),
                  ),
                  hintText: 'Pemasukan',
                ),
              ),
              TextField(
                controller: _pengeluaran,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.pinkAccent,
                    ),
                  ),
                  hintText: 'Pengeluaran',
                ),
              ),
            ],
          ),
        ));
  }
}
