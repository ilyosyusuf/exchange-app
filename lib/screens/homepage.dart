import 'package:flutter/material.dart';
import 'package:oneapp/core/base/basewiev/base_view.dart';
import 'package:oneapp/core/base/basewiev/utils/flag_data.dart';
import 'package:oneapp/models/currency_model.dart';
import 'package:oneapp/services/currency_service.dart';
import 'package:oneapp/widgets/container_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(viewModel: HomePage, OnPageBuilder: (context, widget){
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: Text("Currencies", style: TextStyle(fontSize: 25.0),),)
              ),
              Expanded(
                flex: 9,
                child: FutureBuilder(
                  future: CurrencyService.getCurrencies(),
                  builder: (context, AsyncSnapshot<List<CurrencyModel>> snap){
                    if (!snap.hasData) {
                      return Center(child: CircularProgressIndicator.adaptive(),);
                    } else if(snap.hasError){
                      return Center(child: Text("No Internet Connection"),);
                    } else{
                      var data = snap.data;
        
                      return ListView.builder(
                        itemBuilder: (context, i){
                          return ContainerWidget(title: data![i].title.toString(), subtitle: data[i].cbPrice.toString(),leading: FlagData.flagList[i].toString(),);
                        },
                        itemCount: data!.length, 
                      );
                    }
                  }
                )
              ),
            ],
          ),
        )
    );
    });
  }
}
