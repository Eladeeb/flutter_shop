import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _title  = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _price = TextEditingController();
  String selectedValue = 'Select Category' ;
  bool isError = false ;
  File _image ;

  Future getImage()async{
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image ;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _title.dispose();
    _description.dispose();
    _price.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('New Product'),),
      body:
      //drawProducts(),
      Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller:  _title,
                  decoration: InputDecoration(
                    hintText: 'Product Title'
                  ),
                  validator: (value){
                    if(value.isEmpty){
                      return 'Product title is required' ;
                    }
                    return null ;
                },
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: _description,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Product Description'
                  ),
                  validator: (value){
                    if(value.isEmpty){
                      return 'plese enter some text' ;
                    }
                    return null ;
                  },
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: _price,
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: InputDecoration(
                      hintText: 'Price'
                  ),
                  validator: (value){
                    if(value.isEmpty){
                      return 'plese enter price' ;
                    }
                    return null ;
                  },
                ),
                SizedBox(height: 10,),
                SizedBox(
                  width: double.infinity,
                  child:_selectCategory(),
                ),
                SizedBox(height: 20,),
                RaisedButton(
                  color: Colors.teal,
                  child: Text('Select Image',style: TextStyle(color: Colors.white
                  ),
                  ),
                  onPressed: (){
                    getImage();
                  },
                ),
                SizedBox(height: 20,),
                RaisedButton(
                  color: Colors.teal,
                  child: Text('Save Product',style: TextStyle(color: Colors.white
                  ),
                  ),
                  onPressed: ()async{
                    if(_formKey.currentState.validate()){
                      await Firestore.instance.collection('products').document()
                          .setData({
                        'product_title': _title.text ,
                        'product_description': _description.text ,
                        'product_price': _price.text,
                        'category_name' : selectedValue ,
                      });
                      await uploadImage(_image);
                    }
                  },
                ),
                SizedBox(height: 24,),
                SizedBox(width: double.infinity,
                child: (isError)? Text('Error Slecting Category',style: TextStyle( color: Colors.red),): Container(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void >uploadImage(File image)async{
    String number = Random().nextInt(10000).toString();
    String name = await image.rename('prod$number').toString();
    final StorageReference storageReference = FirebaseStorage().ref().child(name);
    final StorageUploadTask uploadTask =storageReference.putFile(image);
    await uploadTask.onComplete;
  }

 Widget _selectCategory() {
    return StreamBuilder(
      stream: Firestore.instance.collection('categories').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return new Text('Loading...');
          default:
            return DropdownButton<String>(

              items: snapshot.data.documents.map((DocumentSnapshot document){
                return DropdownMenuItem<String> (
                  value: document['name'],
                  child: Text(document['name']),
                );
            }).toList(),

              onChanged: (String newValue){
                if( newValue == 'Select Category'){
                  setState(() {
                    isError = true ;
                  });
                }else{
                  setState(() {
                    selectedValue = newValue ;
                  });
                }

              },
              value: selectedValue,
            );
        }
      },
    );
 }

}
