import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  String title;
  String subtitle;
  String? trailing;
  String? leading = "";
  ContainerWidget({ Key? key, required this.title, required this.subtitle, this.leading, this.trailing }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
          // leading: CircleAvatar(backgroundImage: NetworkImage(leading.toString())),
          // trailing: Text(trailing.toString()),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 0,
              blurRadius: 7,
              offset: Offset(2, 5),
            ),
          ],
          borderRadius: BorderRadius.circular(15.0)
        ),
      ),
    );
  }
}