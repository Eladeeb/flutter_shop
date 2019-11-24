
import 'package:flutter_shop/category/base_category.dart';
import 'package:flutter_shop/category/category_controller.dart';
import 'package:flutter_shop/discount/base_discount.dart';
import 'package:flutter_shop/discount/discount_controller.dart';
import 'package:flutter_shop/images/base_image.dart';
import 'package:flutter_shop/images/image_controller.dart';
import 'package:flutter_shop/product_option/base_option.dart';
import 'package:flutter_shop/tag/base_tag.dart';
import 'package:flutter_shop/tag/tag_controller.dart';

class BaseProduct{
  String id, title , description ;
  double price , quantity ;
  List<BaseImage> images ;
  List<BaseCategory> categories ;
  List<BaseProductOption> options ;
  List<BaseTag> tags ;
  List<BaseDiscount> discount ;

  BaseProduct(this.id, this.title, this.description, this.price, this.quantity,
      this.images, this.options, this.tags, this.discount);

  BaseProduct.fromJson(Map<String,dynamic> jsonObject){
  this.id =jsonObject['id'];
  this.title=jsonObject['title'];
  this.description=jsonObject['description'];
  this.price=jsonObject['price'];
  this.quantity=jsonObject['quantity'];
  this.images =ImageController.toImages(jsonObject['images']);
  this.categories = CategoryController.toCategories(jsonObject['categories']);
  this.tags = TagController.toTags(jsonObject['tags']);
  this.discount =DiscountController.toDiscounts(jsonObject['discounts']);


  }
}