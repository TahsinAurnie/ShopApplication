import 'package:flutter/material.dart';
import 'package:flutter_shop_application/providers/orders.dart';
import 'package:flutter_shop_application/widget/app_drawer.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart' show Cart;
import '../widget/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total",
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                          //color: Theme.of(context).primaryTextTheme.bodyText2.color,
                          color: Colors.white),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(
                          cart.items.values.toList(), cart.totalAmount);
                      cart.clearCart();
                    },
                    child: Text("Order Now",
                        style:
                            TextStyle(color: Theme.of(context).primaryColor)),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, i) => CartItem(
                id: cart.items.values.toList()[i].id,
                title: cart.items.values.toList()[i].title,
                quantity: cart.items.values.toList()[i].quantity,
                price: cart.items.values.toList()[i].price,
                productId: cart.items.keys.toList()[i]),
          ))
        ],
      ),
    );
  }
}
