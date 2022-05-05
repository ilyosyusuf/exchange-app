import 'dart:convert';

import 'package:hive_flutter/adapters.dart';
part 'currency_model.g.dart';

List<CurrencyModel> currencyModelFromJson(String str) =>
    List<CurrencyModel>.from(
        json.decode(str).map((x) => CurrencyModel.fromJson(x)));

@HiveType(typeId: 1)
class CurrencyModel {
  CurrencyModel({
    this.title,
    this.code,
    this.cbPrice,
    this.nbuBuyPrice,
    this.nbuCellPrice,
    this.date,
  });
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? code;
  @HiveField(2)
  String? cbPrice;
  @HiveField(3)
  String? nbuBuyPrice;
  @HiveField(4)
  String? nbuCellPrice;
  @HiveField(5)
  String? date;

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
        title: json["title"],
        code: json["code"],
        cbPrice: json["cb_price"],
        nbuBuyPrice: json["nbu_buy_price"],
        nbuCellPrice: json["nbu_cell_price"],
        date: json["date"],
      );
}
