import 'package:flutter/material.dart';
import 'package:oneapp/core/base/basewiev/base_view.dart';
import 'package:oneapp/core/base/basewiev/utils/flag_data.dart';
import 'package:oneapp/models/currency_model.dart';
import 'package:oneapp/services/currency_service.dart';
import 'package:oneapp/widgets/container_widget.dart';

class BoxPage extends StatelessWidget {
  const BoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "Currencies (offline)",
                style: TextStyle(fontSize: 25.0),
              ),
            )),
        Expanded(
            flex: 9,
            child: CurrencyService.box!.isNotEmpty
                ? ListView.builder(
                    itemBuilder: (context, i) {
                      return ContainerWidget(
                          title:
                              CurrencyService.box!.getAt(i)!.title.toString(),
                          subtitle: CurrencyService.box!
                              .getAt(i)!
                              .cbPrice
                              .toString());
                    },
                    itemCount: CurrencyService.box!.length,
                  )
                : SizedBox())
      ],
    )));
  }
}
