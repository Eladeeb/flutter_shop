 class BaseCategory{
  String id, title ,name;

  BaseCategory(this.id, this.title);
  BaseCategory.fromJson(Map<String,dynamic> jsonObject){
    this.id =jsonObject['id'];
    this.title = jsonObject['title'];
    this.name = jsonObject['name'];

  }

}