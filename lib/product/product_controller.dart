import 'base_Product.dart';
class ProductController{
  BaseProduct product ;

  ProductController(this.product);

  static List<BaseProduct> toProducts(List<Map<String,dynamic>> jsonObjects){}
}