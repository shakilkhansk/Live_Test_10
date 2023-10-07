import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
MySnackBar(message, context) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 3),
    ),
  );
}
ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(15),
    backgroundColor: Colors.red,
    foregroundColor: Colors.white,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
    elevation: 5
);
class CartItem {
  String name;
  String color;
  String size;
  int quantity;
  double price;
  String imageUrl;

  CartItem({
    required this.name,
    required this.color,
    required this.size,
    required this.quantity,
    required this.price,
    required this.imageUrl,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CartPage(),
    );
  }
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> cartItems = [
    CartItem(
      name: 'Product 1',
      color: 'Red',
      size: 'M',
      quantity: 2,
      price: 10.0,
      imageUrl: 'https://dtt1c9id3txwq.cloudfront.net/assets/images/001/478/183/original/IMILAB-IMIKI-SF1E-Smartwatch---Gun-Black-7901.jpg?1691684421',
    ),
    CartItem(
      name: 'Product 2',
      color: 'Blue',
      size: 'L',
      quantity: 1,
      price: 15.0,
      imageUrl: 'https://dtt1c9id3txwq.cloudfront.net/assets/images/001/442/288/large/71ELRXSTM1L._SX425_.jpg?1671370714',
    ),
    CartItem(
      name: 'Product 3',
      color: 'Black',
      size: 'XL',
      quantity: 1,
      price: 20.0,
      imageUrl: 'https://dtt1c9id3txwq.cloudfront.net/assets/images/001/468/544/large/baseus-bipow-20w-digital-display-30000mah-power-bank-6.jpg?1686927081',
    ),
    // Add more items as needed
  ];

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var item in cartItems) {
      totalPrice += item.price * item.quantity;
    }
    return totalPrice;
  }

  void updateTotalPrice() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = calculateTotalPrice();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white24,
        elevation: 0,
        actions: const [
          Padding(padding: EdgeInsets.all(8),child: Icon(Icons.search,color: Colors.black)),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(padding: EdgeInsets.all(15),child: Text('My Bag',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),)),
          Expanded(child: ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              return CardView(
                cartItem: cartItems[index],
                updateTotalPrice: updateTotalPrice,
              );
            },
          ))
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Total Amount: \$${totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 50,
              width: double.infinity, // Makes the button take up the full width
              child: ElevatedButton(style: buttonStyle,
                onPressed: () {
                  MySnackBar('Congratulation! Checkout successful', context);
                },
                child: const Text('CHECK OUT'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardView extends StatefulWidget {
  final CartItem cartItem;
  final Function updateTotalPrice;

  CardView({required this.cartItem, required this.updateTotalPrice});

  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  int quantity = 0;

  @override
  void initState() {
    super.initState();
    quantity = widget.cartItem.quantity;
  }

  void increaseQuantity() {
    setState(() {
      quantity++;
      widget.cartItem.quantity = quantity;
      widget.updateTotalPrice();
    });
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
        widget.cartItem.quantity = quantity;
        widget.updateTotalPrice();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        title: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.cartItem.imageUrl ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.cartItem.name),
                  Text('Color: ${widget.cartItem.color}   Size: ${widget.cartItem.size}'),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(child: IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: decreaseQuantity,
                      )),
                      Padding(padding: const EdgeInsets.all(10),child: Text('$quantity')),
                      CircleAvatar(child: IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: increaseQuantity,
                      )),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                PopupMenuButton(
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'remove',
                      child: Text('Remove'),
                    ),
                    // Add more menu items as needed
                  ],
                  onSelected: (value) {
                    if (value == 'remove') {
                      // Remove item logic
                    }
                  },
                ),
                const SizedBox(height: 16.0),
                Text('\$${widget.cartItem.price.toStringAsFixed(2)}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
