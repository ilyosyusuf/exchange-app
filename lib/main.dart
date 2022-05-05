import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:oneapp/models/currency_model.dart';
import 'package:oneapp/screens/homepage.dart';
import 'package:oneapp/services/currency_service.dart';

void main() async {
  await Hive.initFlutter();
  await CurrencyService.openBox();
  Hive.registerAdapter(CurrencyModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const HomePage(),
    );
  }
}
