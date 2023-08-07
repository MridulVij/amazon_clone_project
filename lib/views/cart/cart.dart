import 'package:flutter/material.dart';

class CartUI extends StatefulWidget {
  const CartUI({super.key});

  @override
  State<CartUI> createState() => _CartUIState();
}

class _CartUIState extends State<CartUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Cart')),
    );
  }
}
