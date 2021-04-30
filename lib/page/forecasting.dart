import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Forecasting extends StatefulWidget {
  @override
  _ForecastingState createState() => _ForecastingState();
}

class _ForecastingState extends State<Forecasting> {
  // @override
  CollectionReference forecast = FirebaseFirestore.instance
      .collection('Forecasting'); //Call firestore which is 'Forecasting'
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Covid Analyzer',
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
          stream: forecast.snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              const Text('Loading');
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot mypost = snapshot.data.docs[index];
                    return Stack(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 375.0,
                          child: Padding(
                            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Material(
                              color: Color(0xffFFFAFA),
                              elevation: 14.0,
                              shadowColor: Color(0xffFF7F50),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 250.0,
                                        child: Image.network(
                                            '${mypost['image']}', //Load image fro firestore
                                            fit: BoxFit.fill),
                                      ),
                                      SizedBox(height: 10.0),
                                      Text(
                                        '${mypost['title']}', //Load title from firestore
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  });
            }
          },
        ));
  }
}
