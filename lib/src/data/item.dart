
abstract class Item {
  dynamic toJson(){return {};}
  Item();
  Item.fromJson(dynamic j);

  static instanceFromJson(dynamic j){}

  void fromJson(dynamic j){

  }

}