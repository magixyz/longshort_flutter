
import 'dart:convert';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

import 'item_mapper.dart';
import '../data/item.dart';
import '../data/entity.dart';

final cookie = CookieManager(CookieJar());

class GenericRest<T>{

  String baseUrl;

  final dio = Dio();

  GenericRest( this.baseUrl){


    dio.interceptors.add(cookie);
    dio.interceptors.add(DioCacheInterceptor(options:CacheOptions(
// A default store is required for interceptor.
      store: MemCacheStore(),
// Default.
      policy: CachePolicy.request,
// Returns a cached response on error but for statuses 401 & 403.
// Also allows to return a cached response on network errors (e.g. offline usage).
// Defaults to [null].
      hitCacheOnErrorExcept: [401, 403],
// Overrides any HTTP directive to delete entry past this duration.
// Useful only when origin server has no cache config or custom behaviour is desired.
// Defaults to [null].
      maxStale: const Duration(days: 7),
// Default. Allows 3 cache sets and ease cleanup.
      priority: CachePriority.normal,
// Default. Body and headers encryption with your own algorithm.
      cipher: null,
// Default. Key builder to retrieve requests.
      keyBuilder: CacheOptions.defaultCacheKeyBuilder,
// Default. Allows to cache POST requests.
// Overriding [keyBuilder] is strongly recommended when [true].
      allowPostMethod: false,
    )
    ));
  }


  Future<T?> restGenericLoadByPath<T>(String entity, String path,T Function(dynamic j) constructor,{
    String version='v1',
    Map<String,dynamic>? params
  }) async{

    var url = '$baseUrl/$version/$entity/$path';

    print(url);
    var response = await dio.get(url,queryParameters: params);


    if ( response.statusCode != 200){

      print(response.statusCode);

      return null;

    }

    print('response: ' +  jsonEncode(response.data));


    return ItemMapper.parseItem(response.data, constructor);

  }


  Future<List<T>?> restGenericListByPath<T>(String entity,String path,T Function(dynamic j) constructor,{
    String version='v1'
  }) async{

    var url = '$baseUrl/$version/$entity/$path';

    print(url);
    var response = await dio.get(url);


    if ( response.statusCode != 200){

      print(response.statusCode);
      return null;

    }

    print(response.data);

    return ItemMapper.parseEntityList(response.data, constructor);


  }

  Future<T?> restGenericLoad<T>(String entity, String uuid,T Function(dynamic j) constructor,{
    String version='v1'
  }) async{

    var url = '$baseUrl/$version/$entity/$uuid';

    print(url);
    var response = await dio.get(url);


    if ( response.statusCode != 200){

      print(response.statusCode);

      return null;
    }

    print(response.data);

    return ItemMapper.parseItem(response.data, constructor);

  }


  Future<List<T>?> restGenericList<T>(String entity,T Function(dynamic j) constructor,{
    String version='v1', String? subpath
  }) async{

    var url = '$baseUrl/$version/$entity';
    if (subpath != null) url += subpath;

    print(url);
    var response = await dio.get(url);


    if ( response.statusCode != 200){

      print(response.statusCode);

      return null;
    }

    print(response.data);

    return ItemMapper.parseEntityList(response.data, constructor);

  }


  Future<List<T>?> restGenericListByForeign<T>(String entity,String foreign,String uuid,T Function(dynamic j) constructor,{
    String version='v1'
  }) async{

    var url = '$baseUrl/$version/$entity/list-by-foreign/$foreign/$uuid';


    // var url = Uri(scheme: Global.SERVICE_SCHEME,host: Global.SERVICE_HOST,port: Global.SERVICE_PORT,path: '/rest/generic/${entity}-list', queryParameters: condition);

    print(url);
    var response = await dio.get(url);


    if ( response.statusCode != 200){

      print(response.statusCode);

      return null;
    }

    print(response.data);


    return ItemMapper.parseEntityList(response.data, constructor);


  }

  Future<T?> restGenericPost<T extends Entity>(String entity, dynamic t, T Function(dynamic j) constructor,{
    String version='v1'
  })async{
    var url = '$baseUrl/$version/$entity';

    print(url);
    print(t);
    var response = await dio.post(url,data: t);


    if ( response.statusCode != 200){

      print(response.statusCode);
      return null;

    }

    print(response.data);

    return await ItemMapper.parseItem(response.data, constructor);

  }

  Future<T?> restGenericPatch<T extends Item>(String entity, String uuid,String field, dynamic t, T Function(dynamic j) constructor,{
    String version='v1'
  })async{
    var url = '$baseUrl/$version/$entity/$uuid/$field';

    print(url);
    print(t);
    var response = await dio.patch(url,data: t);


    if ( response.statusCode != 200){

      print(response.statusCode);

      return null;
    }

    print(response.data);

    return await ItemMapper.parseItem(response.data, constructor);

  }

}
