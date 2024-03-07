import 'package:catalog_app/Models/cart.dart';
import 'package:catalog_app/Models/catalog.dart';
import 'package:catalog_app/core/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


class AddToCart extends StatelessWidget{
  final Item catalog;
  AddToCart({super.key,required this.catalog});

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation,RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    // final CatalogModel _catalog = (VxState.store as MyStore).catalog;
    bool isInCart = _cart.items.contains(catalog) ?? false;

    return ElevatedButton(
      onPressed: () {
        if(!isInCart){
          AddMutation(catalog);
        //   isInCart = isInCart.toggle();
        // _cart.catalog = _catalog;
        // _cart.add(catalog);
        // setState(() {});
        }
      },
      child: isInCart?Icon(Icons.done,color: Colors.white,):Icon(CupertinoIcons.cart_badge_plus,color: Colors.white,),
      style: ButtonStyle(

        backgroundColor:
        MaterialStateProperty.all(context.theme.hoverColor),
        shape: MaterialStateProperty.all(const StadiumBorder()),
      ),
    );
  }
}