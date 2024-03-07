import 'package:catalog_app/Models/catalog.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
   ItemWidget({super.key,required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            onTap: (){
              print("${item.name} presses");
            },
            leading: Image.network(item.image),
            title: Text(item.name),
            subtitle: Text(item.desc),
            trailing: Text("\$${item.price.toString()}",textScaleFactor: 1.2,style: TextStyle(color: Colors.deepPurpleAccent),),
          ),
        ),
      ],
    );
  }
}
