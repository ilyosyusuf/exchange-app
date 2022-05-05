
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:oneapp/models/currency_model.dart';
import 'package:path_provider/path_provider.dart';

class CurrencyService{
  static Box<CurrencyModel>? box;

  static Future<List<CurrencyModel>?> getCurrencies()async{
    try {
    Response res = await Dio().get('https://nbu.uz/en/exchange-rates/json/');
    List<CurrencyModel> d = (res.data as List).map((e) => CurrencyModel.fromJson(e)).toList();
    await putData(d);
    return d;
    } catch (e) {
      print(e);
    }
  }


  static openBox()async{
    box = await Hive.openBox('currencybox');
    
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
  }

  static putData(List<CurrencyModel> data)async{
    await box!.clear();
    for(var item in data){
      await box!.add(item);
    }
  }

}
