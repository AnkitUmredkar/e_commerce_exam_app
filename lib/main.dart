import 'package:flutter/material.dart';
import 'Screens/cart_page.dart';
import 'Screens/home_page.dart';
import 'Screens/product_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        '/ProductPage': (context) => const ProductPage(),
        '/CartPage': (context) => const CartPage(),
      },
    );
  }
}
