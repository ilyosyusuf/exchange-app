import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:oneapp/extensions/context_extensions.dart';
import 'package:oneapp/screens/box_page.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({ Key? key }) : super(key: key);

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: context.h * 0.35,
            child: Lottie.asset('assets/lotties/nointernet.json'),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text("There is a problem with the internet connection. Do you want to switch to offline mode? ", textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0),),
          ),
          ElevatedButton(
            child: Text("Yes"),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: Color.fromARGB(255, 73, 168, 78),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),), 
                fixedSize: Size(100, 40),
              ),
            onPressed: (){
              // Navigator.pushNamedAndRemoveUntil(context, '/boxpage', (route) => false);
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> BoxPage()), (route) => false);
              setState(() {
                
              });
            },
            )
        ],
      )
    );
  }
}