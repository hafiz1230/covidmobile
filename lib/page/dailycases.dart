import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DailyCases extends StatefulWidget {
  @override
  _DailyCasesState createState() => _DailyCasesState();
}

class _DailyCasesState extends State<DailyCases> {
  CollectionReference dailys = FirebaseFirestore.instance
      .collection('Daily Cases'); //Call firestore which is 'Daily Cases'
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'State cases',
            style: TextStyle(fontSize: 19, fontStyle: FontStyle.italic),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffcc2b5e), Color(0xff753a88)],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          //StreamBuilder
          stream: dailys.snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot daily = snapshot.data.docs[index];
                  return ListTile(
                    leading:
                        Image.network(daily['img']), //Load image from firestore
                    title: Text(
                      daily['title'],
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ), //Load title from firestore
                    subtitle: Text(
                      daily['detail'],
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ), //Load detail from firestore
                  );
                });
          },
        ));
  }
}
