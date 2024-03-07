import 'package:catalog_app/Models/catalog.dart';
import 'package:catalog_app/Widget/add_to_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: (context.cardColor),
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.xl3.bold.red800.make(),
            AddToCart(catalog: catalog),
            // ElevatedButton(
            //   style: ButtonStyle(
            //     shape: MaterialStateProperty.all(StadiumBorder()),
            //     backgroundColor:
            //         MaterialStateProperty.all(context.theme.hoverColor),
            //   ),
            //   onPressed: () {},
            //   child: "Add to cart".text.make(),
            // ).wh(120, 50),
          ],
        ).p32(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(icon: Icon(CupertinoIcons.left_chevron),onPressed: (){Navigator.pop(context);},),
      ),
      backgroundColor: (context.canvasColor),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(
                catalog.id.toString(),
              ),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30,
                arcType: VxArcType.convey,
                edge: VxEdge.top,
                child: Container(
                  width: context.screenWidth,
                  color: (context.cardColor),
                  child: Column(
                    children: [
                      catalog.name.text.bold.color(context.primaryColor).xl4.make(),
                      catalog.desc.text.center.textStyle(context.captionStyle).gray500.xl2.make().h4(context),
                      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here'"
                          .text
                          .center
                          .textStyle(context.captionStyle).gray500
                          .make()
                          .expand(),
                    ],
                  ).py32(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
