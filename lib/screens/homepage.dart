import 'package:flutter/material.dart';
import 'package:oneapp/core/base/basewiev/base_view.dart';
import 'package:oneapp/extensions/context_extensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(viewModel: HomePage, OnPageBuilder: (context, widget){
      return Scaffold(
        appBar: AppBar(title: Text("Internet Connected")),
        body: Column(
      children: [
        SizedBox(
          child: Text("Sizedbox"),
          height: context.h * 0.5,
        ),
        // FractionallySizedBox(
        //   heightFactor: 0.01,
        //   widthFactor: 10,
        //   child: Text("fractionally sizedbox"),
        // ),
      ],
    ));
    });
  }
}
