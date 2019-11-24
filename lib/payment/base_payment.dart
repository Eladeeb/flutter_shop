 class BasePayment{
  String paymentID,paymentMethod;
  double amount ;
  DateTime paymentDate ;

  BasePayment(this.paymentID, this.paymentMethod, this.amount,
      this.paymentDate);
  BasePayment.fromJson(Map<String,dynamic> jsonObject){
    this.paymentDate = jsonObject['payment_date'];
    this.paymentID = jsonObject['payment_id'];
    this.amount= jsonObject['amount'];
    this.paymentMethod = jsonObject['payment_method'];
  }


}