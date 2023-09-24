import 'package:flutter/material.dart';

main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeActivity(),);
  }
}
class HomeActivity extends StatefulWidget{
  const HomeActivity({super.key});

  @override
  State<StatefulWidget> createState() => _HomeActivityState();

}
class _HomeActivityState extends State<HomeActivity>{
  var products = [
    {'name':'Product 01','price': '50'},
    {'name':'Product 02','price': '10'},
    {'name':'Product 03','price': '15'},
    {'name':'Product 04','price': '20'},
    {'name':'Product 05','price': '25'},
    {'name':'Product 06','price': '30'},
    {'name':'Product 07','price': '35'},
    {'name':'Product 08','price': '40'},
    {'name':'Product 09','price': '50'},
    {'name':'Product 10','price': '75'},
  ];
  List<int> productCounters = List.generate(10, (index) => 0);
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        centerTitle: true,
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(products[index]['name']!),
              subtitle: Text('Price: '+products[index]['price']!),
              trailing: Column(
                  children: [
                    Text("Counter: ${productCounters[index]}"),
                    Expanded(child: ElevatedButton(onPressed: (){
                      if(productCounters[index]<=4){
                        setState(() {
                          productCounters[index]++;
                          if(productCounters[index]==5){
                            MyAlertDialoge(context,products[index]['name']! );
                          }
                          counter = productCounters.where((element) => element != 0).length;
                        });
                      }
                    }, child: Text('Buy Now')))
                  ],
                ),
            );
          },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage(counter.toString())));
        },
        child: Icon(Icons.shopping_cart_sharp),
      ),
    );
  }
}

class CartPage extends StatefulWidget {
  String total = '0';
  CartPage(this.total, {super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Total Products: ${widget.total}"),
      ),
    );
  }
}


MyAlertDialoge(context,String product){
  return showDialog(context: context, builder: (BuildContext context) {
    return Expanded(child: AlertDialog(
      title: Text('Congratulations!'),
      content: Text("You've bought 5 $product"),
      actions: [
        TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text('OK')),
      ],
    ));
  });
}