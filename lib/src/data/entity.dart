
import 'item.dart';

abstract class Entity extends Item {

  String uuid;
  String created_date;
  String updated_date;

  Entity(this.uuid,this.created_date,this.updated_date);

  @override
  dynamic toJson(){
    return {
      "uuid":uuid,
      "created_date":created_date,
      "updated_date":updated_date
    };
  }

}