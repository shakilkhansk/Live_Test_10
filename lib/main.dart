import 'package:flutter/material.dart';

main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeActivity());
  }
}

class HomeActivity extends StatelessWidget{
  const HomeActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 70,
        toolbarHeight: 100,
        leading: Icon(Icons.home),
        title: Text('MyApp'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.share))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "This is mod 5 Assignment",
              style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
            RichText(text: TextSpan(
              style: TextStyle(color: Colors.amber,fontSize: 18),
              children: [
                TextSpan(text: 'My ',style: TextStyle(color: Colors.red)),
                TextSpan(text: 'phone ',style: TextStyle(color: Colors.cyan,fontSize: 12)),
                TextSpan(text: 'name ',style: TextStyle(color: Colors.purple,fontSize: 15,fontWeight: FontWeight.bold)),
                TextSpan(text: 'Poco x4 Pro'),
              ]
            ))
          ],
        ),
      ),

    );
  }
}