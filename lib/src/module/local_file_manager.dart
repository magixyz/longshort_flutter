

import 'dart:convert';
import 'dart:io';

import 'package:longshort_flutter/longshort_flutter.dart';
import 'package:path/path.dart';

import '../utils/item_mapper.dart';

class LocalFileManager{

  String absoluteDirctory;

  LocalFileManager._instance(this.absoluteDirctory);

  static Future<LocalFileManager> instance(String absoluteDirctory)async{

    if (! await Directory(absoluteDirctory).exists()){
      await Directory(absoluteDirctory).create(recursive: true);
    }

    return LocalFileManager._instance(absoluteDirctory);

  }


  Future writeFile(String filename,String content)async{
    File f = File(join(absoluteDirctory ,filename) );

    await f.writeAsString(content);
  }

  Future<String> readFile(String filename)async{
    File f = File(join(absoluteDirctory ,filename));

    if (!f.existsSync()){
      f.createSync();
    }

    return await f.readAsString();
  }

  Future<Map<String,T>> readMap<T>(String filename,T Function(dynamic j) constructor) async{

    Map<String,T> ret = {};
    
    String content = await readFile(filename);


    if (content.isEmpty) content = '{}';

    var j = jsonDecode(content) ;
    
    return ItemMapper.parseItemMap<T>(j,  constructor);
  }


  Future<List<T>> readList<T>(String filename,T Function(dynamic j) constructor) async{

    String content = await readFile(filename);

    if (content.isEmpty) content = '[]';

    var j = jsonDecode(content) ;

    return ItemMapper.parseEntityList(j, constructor);
  }


  Future<T?> readObject<T>(String filename, T Function(dynamic j) constructor)async{

    if (await File(join(absoluteDirctory,filename)).exists()){

      String content = await readFile(filename);


      var j = jsonDecode(content) ;

      return await ItemMapper.parseItem(j, constructor);
    }else{
      return null;
    }

  }



  Future writeObject<T extends Item>(String filename,T obj)async{
    String content = jsonEncode(obj.toJson());

    await writeFile(filename, content);

  }

  Future writeMap<T extends Item>(String filename,Map<String,T> map) async{
    var j = ItemMapper.dumpItemMap(map);

    String content = jsonEncode(j);

    await writeFile(filename, content);
  }

  Future writeList<T extends Item>(String filename,List<T> list) async{
    var j = ItemMapper.dumpItems(list);

    String content = jsonEncode(j);

    await writeFile(filename, content);
  }

}