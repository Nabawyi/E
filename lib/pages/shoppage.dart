import 'package:ecommerceapp/models/cart.dart';
import 'package:ecommerceapp/models/shoe.dart';
import 'package:ecommerceapp/models/shoelist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../componets/shoetile.dart';

class Shoppage extends StatefulWidget {
  const Shoppage({
    super.key,
  });

  @override
  State<Shoppage> createState() => _ShoppageState();
}

class _ShoppageState extends State<Shoppage> {
  //add shoe to cart
  void addshoetocart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).additemtothecart(
      shoe,
    );
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('added to the cart'),
        content: Text('chek your cart pelase'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Search',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.grey,
                  )
                ],
              )),
          //massege
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Text(
              'Impossible Is Nothing',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  'Hot Picks 🔥',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ShoesListClass().shoeslist1.length,
              itemBuilder: (context, index) {
                Shoe shoe = ShoesListClass().shoeslist1[index];
                return ShoeTile(
                  shoe: shoe,
                  onTap: () => addshoetocart(shoe),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 25, left: 25, right: 25),
            child: Divider(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
