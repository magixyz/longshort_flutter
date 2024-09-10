
import 'dart:convert';

import 'package:dio/dio.dart';

import '../../longshort_flutter.dart';
import '../utils/item_mapper.dart';
import 'ls_net.dart';

class LsRpc{

  final dio = Dio(BaseOptions(contentType: "application/json"));

  String BASE_URL;

  LsRpc(this.BASE_URL){

    dio.interceptors.add(cookie);
  }


  Future<T2?> rpc<T1 extends Item,T2 extends Item>(String path, T1? input, T2 Function(dynamic j) constructor ) async{
    var uri = Uri.parse( '$BASE_URL$path' );

    var response;

    if (input != null){
      var body = input.toJson();

      response = await dio.postUri(uri,data: body);
    }else{
      response = await dio.postUri(uri);
    }


    if (response.statusCode != 200) return null;

    return ItemMapper.parseItem(response.data, constructor);

  }

}