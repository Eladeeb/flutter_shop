import 'package:flutter_shop/user/customer.dart';
import 'package:flutter_shop/order/base_order.dart';
import 'package:flutter_shop/product/base_Product.dart';
class CustomerController{
  Customer customer ;


  CustomerController(this.customer);

  void addToOrder(BaseOrder order){
    customer.orders.add(order);
  }
  void addToWatchList(BaseProduct product){
    customer.watchList.add(product);
  }
  bool orderInOrders(BaseOrder order){
    return customer.orders.contains(order);
  }
  bool productInWatchList(BaseProduct product){
    return customer.watchList.contains(product);
  }

}