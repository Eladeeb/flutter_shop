import 'package:flutter/material.dart';
import 'package:flutter_shop/admin/add_category.dart';
import 'package:flutter_shop/admin/categories.dart';
import 'admin/add_product.dart';
import 'admin/products.dart';

void main() {
  runApp(FlutterShop());
}

class FlutterShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthTest(),
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
      routes: {
        'add_category' : (context) => AddCategoryScreen(),
        'categories' : (context) => AllCategories(),
        'add_product': (context) => AddProduct(),
        'products' : (context) => AllProducts(),

      },
    );
  }
}

class AuthTest extends StatefulWidget {
  @override
  _AuthTestState createState() => _AuthTestState();
}

class _AuthTestState extends State<AuthTest> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ListTile(
              title: Text('Products'),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.pushNamed(context, 'products');
              },
            ),
          ListTile(
              title: Text('Categories'),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.pushNamed(context, 'categories');
              },
            ),
          ListTile(
              title: Text('Add Products'),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.pushNamed(context, 'add_product');
              },
            ),
          ListTile(
              title: Text('Add Category'),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.pushNamed(context, 'add_category');
              },
            ),
          ],
        ),
      ),
    );
  }

//    @override
//    Widget build(BuildContext context) {
//      return Scaffold(
//        appBar: AppBar(
//          title: Text('Auth Test')
//          ,
//        ),
//        body: Container(
//          child: Center(
//            child: Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Text('register'),
//                TextFormField(
//                  controller: _email,
//                  decoration: InputDecoration(
//                    hintText: 'Email'
//                  ),
//                ),
//                TextFormField(
//                  obscureText: true,
//                  controller: _pass,
//                  decoration: InputDecoration(
//                      hintText: 'password'
//                  ),
//                ),
//                RaisedButton(
//                  child:  Text('register'),
//                  onPressed: ()async{
//                    String email = _email.text ;
//                    String password = _pass.text;
//                    var user = await firebaseAuthentication.sigIn(email, password);
//                    print(user);
//                  },
//                ),
//
//                RaisedButton(
//                  child:  Text('SIGN OUT'),
//                  onPressed: ()async{
//                    firebaseAuthentication.signOut();
//                  },
//                ),
//
//              ],
//            ),
//          ),
//        ),
//      );
//    }
//  }


}