import 'package:flutter/material.dart';

main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(home: HomeActivity(),);
  }
}
MySnackBar(message,context){
  return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
      )
  );
}
class HomeActivity extends StatelessWidget{
  HomeActivity({super.key});
  var myList = [
    {
      'name': 'Flower 01', 'img' : 'https://wallpapers.com/images/hd/one-dark-pink-flower-ebsu0arli8p5x5as.webp',
    },
    {
      'name': 'Flower 02', 'img' : 'https://wallpapers.com/images/hd/pink-anthurium-flower-a1tiy5bpczkyyybn.webp',
    },
    {
      'name': 'Flower 03', 'img' : 'https://wallpapers.com/images/hd/black-rose-flower-62fqn27bjuaybyop.webp'
    },
    {
      'name': 'Flower 04', 'img' : 'https://wallpapers.com/images/high/macro-shot-of-pink-sunflower-m1eh0uh0ahjzpchn.webp'
    },
    {
      'name': 'Flower 05', 'img' : 'https://wallpapers.com/images/high/close-up-shot-of-burgundy-rose-m2if1v7bqy6gcprw.webp'
    },
    {
      'name': 'Flower 06', 'img' : 'https://wallpapers.com/images/high/red-rose-floating-on-water-zi9inv2edcgsjj6d.webp'
    }
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(padding: EdgeInsets.all(10),
              child: Text('Welcome to my Photo Gallery',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
            ),
          ),
        Padding(padding: EdgeInsets.all(10),child:
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            label: Text('Search for photos...'),
          ),
        ),),
          Expanded(child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: myList.length,
              itemBuilder: (context,index){
                return GestureDetector(
                  onTap: (){MySnackBar(myList[index]['name']!, context);},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(padding: EdgeInsets.all(10),child: Image.network(myList[index]['img']!, fit: BoxFit.cover,height: 80, width: 80,)),
                      Text(myList[index]['name']!)
                    ],
                  ),
                );
              }),
          ),
          Expanded(child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context,index){
                return GestureDetector(
                  onTap: (){MySnackBar(myList[index]['name']!, context);},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(myList[index]['name']!),
                      leading: Image.network(myList[index]['img']!, fit: BoxFit.cover,height: 40, width: 40,),
                      subtitle: Text('Description for photo $index'),),
                      Divider(height: 1,)
                      // Padding(padding: EdgeInsets.all(10),child: Image.network(myList[index]['img']!, fit: BoxFit.cover,height: 80, width: 80,)),
                      // Text(myList[index]['name']!)
                    ],
                  ),
                );
              }),
          ),
          Center(
            child: ElevatedButton(onPressed: (){MySnackBar('Photos Uploaded Successfully', context);}, child: Icon(Icons.upload))
            ,
          )
        ],
      ),
    );
  }
}