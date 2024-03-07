import 'package:catalog_app/Models/cart.dart';
import 'package:catalog_app/core/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (context.theme.canvasColor),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(CupertinoIcons.left_chevron),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: "Cart".text.color(context.primaryColor).make(),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  final CartModel _cart = (VxState.store as MyStore).cart;

  _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            notifications:  {},
              mutations: {RemoveMutation},
              builder: (context, store, status) {
                return "\$${_cart.totalPrice}".text.xl4.color(
                    context.primaryColor).make();
              }
          ),
          SizedBox(
            width: 30,
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    'Buying is not supported yet',
                  )));
            },
            child: "Buy".text.white.make(),
            style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all(context.theme.hoverColor),
              shape: MaterialStateProperty.all(StadiumBorder()),
            ),
          ).wh(120, 50),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Cart is Empty".text
        .color(context.primaryColor)
        .xl3
        .make()
        .centered()
        : ListView.builder(
        itemCount: _cart.items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(
              Icons.done,
              color: context.primaryColor,
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.remove_circle_outline,
                color: context.primaryColor,
              ),
              onPressed: () {
                RemoveMutation(_cart.items[index]);
                // setState(() {});
              },
            ),
            title: _cart.items[index].name.text
                .color(context.primaryColor)
                .make(),
          );
        });
  }
}
