import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class AddCategoryScreen extends StatefulWidget {
  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  TextEditingController _name = TextEditingController();
  TextEditingController _title = TextEditingController();
  bool isError = false ;

  var _formKey = GlobalKey<FormState>();
  var isLoading = false ;
  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _title.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Category'),),
      body: Container(
        child: SingleChildScrollView(
          child: (isLoading)? _loading() :_categoryForm()
        )
      ),
    );
  }
  Widget _loading(){
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }


  Widget _categoryForm(){
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              TextFormField(
                controller:  _name,
                decoration: InputDecoration(
                    hintText: 'Category Name'
                ),
                validator: (value){
                  if(value.isEmpty){
                    return 'Category Nameis required' ;
                  }
                  return null ;
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: _title,
                maxLines: 4,
                decoration: InputDecoration(
                    hintText: 'Product Title'
                ),
                validator: (value){
                  if(value.isEmpty){
                    return 'plese enter some text' ;
                  }
                  return null ;
                },
              ),

              SizedBox(height: 24,),
              RaisedButton(
                color: Colors.teal,
                child: Text('Save Category',style: TextStyle(color: Colors.white
                ),
                ),
                onPressed: ()async{
                  setState(() {
                    isLoading = true ;
                  });

                  if(_formKey.currentState.validate()){

                  var response = await Firestore.instance.collection('categories').where('name', isEqualTo: _name.text).snapshots().first;
                  print(response.documents.length);
                  if(response.documents.length >= 1)
                    {
                      setState(() {
                        isLoading = false ;
                        isError = true ;
                      });
                    }else{

                    Firestore.instance.collection('categories').document().setData(
                        {
                          'name': _name.text ,
                          'title': _title.text ,

                        }
                    ).then((onValue){
                      setState(() {
                        isLoading = false ;
                        isError =false ;
                      });
                      _name.text = '';
                      _title.text = '';
                    });
                  }



                  }else{
                    setState(() {
                      isLoading = false ;
                    });
                  }
                },
              ),
                (isError)? error() : Container() ,
            ],
          ),

        ],
      ),
    );
  }
  Widget error(){
    return Container(
      child: Center(
        child: Text("Error ,duplicate category",style: TextStyle(
            color: Colors.red ,
        ),
      ),
      ),
    );
  }
}
