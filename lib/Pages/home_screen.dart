import 'dart:convert';
import 'package:catalog_app/Models/cart.dart';
import 'package:catalog_app/Models/catalog.dart';
import 'package:catalog_app/Pages/home_detail_page.dart';
import 'package:catalog_app/Utilies/routes.dart';
import 'package:catalog_app/Widget/add_to_cart.dart';
import 'package:catalog_app/Widget/mydrawer.dart';
import 'package:catalog_app/core/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson =
        await rootBundle.loadString("assests/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    var productData = decodeData["products"];

    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    // final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,leading: IconButton(icon: Icon(CupertinoIcons.left_chevron),onPressed: (){Navigator.pop(context);},)),
      floatingActionButton: VxBuilder(
        mutations: {AddMutation,RemoveMutation},
        builder:(context, store, status) =>  FloatingActionButton(
          backgroundColor: context.theme.hoverColor,
          onPressed: () {Navigator.pushNamed(context, MyRoutes.cart);},
          child: Icon(CupertinoIcons.cart,color: Colors.white,),
        ).badge(color: Colors.red,size: 20,count: _cart.items.length,textStyle: TextStyle(color: Colors.black)),
      ),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              const CatalogList().py16().expand(),
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Ehsaas Mart".text.xl5.color(context.theme.primaryColor).bold.make(),
        "Trending products".text.xl2.color(context.theme.primaryColor).make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeDetailPage(catalog: catalog),
              ),
            );
          },
          child: CatalogItem(catalog: catalog),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(
            catalog.id.toString(),
          ),
          child: CatalogImage(image: catalog.image),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(context.theme.primaryColor).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).gray500.make(),//.textStyle(context.captionStyle)
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.color(context.theme.primaryColor).bold.make(),
                  AddToCart(catalog: catalog,),
                ],
              ).pOnly(right: 0),
            ],
          ),
        )
      ],
    )).color(context.cardColor).rounded.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p4
        .color(context.canvasColor)
        .make()
        .p16()
        .w40(context);
  }
}


