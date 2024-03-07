import 'package:catalog_app/Pages/cart_page.dart';
import 'package:catalog_app/Pages/login_page.dart';
import 'package:catalog_app/Utilies/routes.dart';
import 'package:catalog_app/Widget/theme.dart';
import 'package:catalog_app/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import 'Pages/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( VxState(store: MyStore(),child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightThem(context),
      darkTheme: MyTheme.darkThem(context),
      // home: HomeScreen(),
      initialRoute: MyRoutes.login,
      routes: {
        MyRoutes.home: (context) => HomeScreen(),
        MyRoutes.login: (context) => LoginPage(),
        MyRoutes.cart: (context) => CartPage(),
      },
    );
  }
}
