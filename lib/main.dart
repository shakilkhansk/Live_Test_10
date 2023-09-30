import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flower Profile'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return PortraitLayout();
          } else {
            return LandscapeLayout();
          }
        },
      ),
    );
  }
}

class PortraitLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipOval(
            child: Image.network('https://images.pexels.com/photos/60597/dahlia-red-blossom-bloom-60597.jpeg',height: 200, width: 200, fit: BoxFit.cover,),
            ),
          ),
        ), // Replace with your image path
        ListTile(
          title: Center(child: Text('Red Dahlia',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
          subtitle: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text('The red dahlia is a popular flowering plant known for its vibrant and rich red-colored flowers. Dahlias, in general, are a diverse group of plants belonging to the Asteraceae family and are native to Mexico,'),
          ),
        ),
        Expanded(
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: 15,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.network('http://wallpapers.net/web/wallpapers/huge-sunflower-hd-wallpaper/thumbnail/lg.jpg',width: 100,height: 100,fit: BoxFit.cover),
              ); // Replace with your image paths
            },
          ),
        ),
      ],
    );
  }
}

class LandscapeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipOval(
                    child: Image.network('https://images.pexels.com/photos/60597/dahlia-red-blossom-bloom-60597.jpeg',height: 200, width: 200, fit: BoxFit.cover,),
                  ),
                ),
              ), // Replace with your image path
              ListTile(
                title: Center(child: Text('Red Dahlia',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
                subtitle: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text('The red dahlia is a popular flowering plant known for its vibrant and rich red-colored flowers. Dahlias, in general, are a diverse group of plants belonging to the Asteraceae family and are native to Mexico,'),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Expanded(
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 15,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.network('http://wallpapers.net/web/wallpapers/huge-sunflower-hd-wallpaper/thumbnail/lg.jpg',width: 100,height: 100,fit: BoxFit.cover),
                ); // Replace with your image paths
              },
            ),
          ),
        ),
      ],
    );
  }
}
