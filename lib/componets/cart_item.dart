import 'package:ecommerceapp/models/cart.dart';
import 'package:ecommerceapp/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Cartitem extends StatefulWidget {
  Shoe shoe;
  Cartitem({super.key, required this.shoe});

  @override
  State<Cartitem> createState() => _CartitemState();
}

class _CartitemState extends State<Cartitem> {
  void removeitemfromcart() {
    Provider.of<Cart>(context, listen: false).removeitemfromcart(
      widget.shoe,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Image.asset(widget.shoe.imagepath),
        title: Text(widget.shoe.name),
        subtitle: Text(widget.shoe.price),
        trailing:  IconButton(
          icon: const Icon(Icons.delete),
          onPressed: removeitemfromcart,
        ),
      ),
    );
  }
}
