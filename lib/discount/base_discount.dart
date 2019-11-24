 class BaseDiscount{
  double minQuantity;
  double maxQuantity;
  DateTime endDate ;

  BaseDiscount(this.minQuantity, this.maxQuantity, this.endDate);
  BaseDiscount.fromJson(Map<String,dynamic> jsonObject){
    this.minQuantity=jsonObject['min_quantity'];
    this.maxQuantity=jsonObject['max_quantity'];
    this.endDate =DateTime.parse(jsonObject['end_date']);
  }


 }