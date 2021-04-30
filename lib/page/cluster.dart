import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Clusters extends StatefulWidget {
  @override
  _ClustersState createState() => _ClustersState();
}

class _ClustersState extends State<Clusters> {
  CollectionReference clusterss = FirebaseFirestore.instance
      .collection('Cluster'); //Call firestore which is 'Cluster'
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Cluster',
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
          stream: clusterss.snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot cluster = snapshot.data.docs[index];
                  return ListTile(
                    leading: Text(
                      cluster['header'],
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ), //Call 'header' from firestore
                    title: Text(
                      cluster['title'],
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ), //Call 'title' from firestore
                    subtitle: Text(
                      cluster['detail'],
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ), //Call 'detail' from firestore
                  );
                });
          },
        ));
  }
}
