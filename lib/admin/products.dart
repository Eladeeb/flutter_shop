import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class AllProducts extends StatefulWidget {
  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Products'),
      ),
      body: drawProducts(),
    );
  }
  Widget drawProducts(){
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('products').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return new Text('Loading...');
          default:
            return new ListView(
              children: snapshot.data.documents.map((DocumentSnapshot document) {
                print(document.data);
                return new ListTile(
                    title:  Text(document['product_title']),
                  subtitle: Text(document['product_price']),
                );
              }).toList(),
            );
        }
      },
    );
  }

}
