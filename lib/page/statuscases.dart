import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StatusCases extends StatefulWidget {
  @override
  _StatusCasesState createState() => _StatusCasesState();
}

class _StatusCasesState extends State<StatusCases> {
  CollectionReference dailys = FirebaseFirestore.instance
      .collection('Status Cases'); //Call firestore which is 'Status Cases'
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Status of cases',
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
          stream: dailys.snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot status = snapshot.data.docs[index];
                  return ListTile(
                    leading: Image.network(
                        status['img']), //Call 'img' from firestore
                    title: Text(
                      status['title'],
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ), //Call 'title' from firestore
                    subtitle: Text(
                      status['detail'],
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ), //Call 'detail' from firetore
                  );
                });
          },
        ));
  }
}
