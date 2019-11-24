import 'package:flutter_shop/order/base_order.dart';
import 'package:flutter_shop/order/order_controller.dart';
import 'package:flutter_shop/product/base_Product.dart';
import 'package:flutter_shop/product/product_controller.dart';

import 'address.dart';
import 'user.dart';

class Customer extends User{
  List<BaseProduct> watchList ;
  List<BaseOrder> orders ;
  Address shippingAddress;
  Address billingAddress ;
  Customer(String id, String firstName, String lastName, String email, String phone,List<BaseProduct> watchList ,
  List<BaseOrder> orders,String gender,Address shippingAddress,Address billingAddress)
      : super(id, firstName, lastName, email, phone, gender){
    this.shippingAddress = shippingAddress;
    this.billingAddress = billingAddress ;
    this.watchList =watchList ;
    this.orders =orders ;
  }
  Customer.fromJson(Map<String,dynamic> jsonObject)
    :super(
    jsonObject['id'],
    jsonObject['first_name'],
    jsonObject['last_name'],
    jsonObject['email'],
    jsonObject['phone'],
    jsonObject['gender'],
    ){
    this.shippingAddress=Address.fromJson(jsonObject['shipping_address']);
    this.billingAddress=Address.fromJson(jsonObject['billing_ddress']);
    this.watchList=ProductController.toProducts(jsonObject['watch_list']);
    this.orders=OrderController.toOrders(jsonObject['orders']);


  }



}