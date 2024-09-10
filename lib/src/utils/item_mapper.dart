
import 'dart:convert';

import 'package:longshort_flutter/longshort_flutter.dart';

class ItemMapper{

  static T parseItem<T>(dynamic j, T Function(dynamic j) constructor) {
    return constructor(j);
  }
  static List<T> parseItems<T extends Item>(dynamic j, T Function(dynamic j) constructor) {
    return List.of(List.of(j).map((i)=>constructor(i)));
  }
  static Map<String,T> parseItemMap<T>(dynamic j, T Function(dynamic j) constructor) {
    Map<String,T> map = {};
    for (String key in j.keys){
      map[key] = constructor(j[key]);
    }
    return map;
  }

  static List<T> parseEntityList<T>(dynamic j, T Function(dynamic j) constructor){
    return List.of(List.of(j).map((i)=>constructor(i)));
  }

  static Map<String,T> parseItemList2Map<T>(dynamic j,String keyField,T Function(dynamic j) constructor ){

    print('parse item list 2 map');
    print(jsonEncode(j));

    Map<String,T> ret = {};

    for (var item in j){
      ret [item[keyField]] = constructor(item);
    }


    return ret;
  }


  static Map<String,T> parseEntityList2Map<T extends Entity>(dynamic j,T Function(dynamic j) constructor ){

    var list = List.of(List.of(j).map((i)=>constructor(i)));

    Map<String,T> ret = {};

    for (var item in list){
      ret[item.uuid!] = item;
    }

    return ret;
  }

  // static Map<String,dynamic> parseItemMap<T>(dynamic j,Map<String,Function(dynamic arg)> items ){
  //
  //   Map<String,dynamic> ret = {};
  //
  //   for (var item in items.keys){
  //     Function(dynamic arg) func = items[item]!;
  //
  //     ret[item] = ret[item] = func(j[item]);
  //   }
  //
  //   return ret;
  // }

  static dynamic dumpItem<T extends Item>(T t) {
    dynamic j = t.toJson();
    return j;
  }
  static dynamic dumpItems<T extends Item>(Iterable<T> ts){

    dynamic j = List.of(ts.map((t) =>t.toJson())) ;
    return j;
  }

  static dynamic dumpItemMap<T extends Item>(Map<String,T> map){

    var j = {};
    for (String key in map.keys){
      j[key] = map[key]?.toJson();

      print('key: $key, value: ${j[key]}');
    }

    return j;
  }


}