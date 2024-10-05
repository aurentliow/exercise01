import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  Widget titleSection = Container( //container untuk menyimpan semua komponen atau 1 halaman
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: const Text(
                "Toba Lake Campground", style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text("Medan, Sumatera Utara", style: TextStyle(color: Colors.grey[500]),
            )
          ],
          )
        ),
        const Icon(
          Icons.star, color: Colors.red,
        ),
        const Text('41'),
      ],
    ),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, "CALL"),
        _buildButtonColumn(color, Icons.near_me, "ROUTER"),
        _buildButtonColumn(color, Icons.share, "SHARE"),
      ],
    );

    Widget textSection = const Padding(padding: EdgeInsets.all(32),
      child: Text("Lake Toba, located in the northern part of the island of Sumatra in Indonesia, is the largest volcanic lake "
      "in the world. It is about 100 kilometers long, 30 kilometers wide, and up to 505 meters deep. Formed in the caldera of a "
      "supervolcano following a massive eruption around 74,000 years ago, the lake is surrounded by steep, lush green hills and "
      "is known for its stunning natural beauty and tranquil environment."
      "At the center of Lake Toba lies Samosir Island, which is roughly the size of Singapore and is one of the few islands located"
      "within a lake on another island. Samosir Island is culturally significant as it is home to the Batak people, an indigenous"
      "ethnic group known for their traditional houses, rich heritage, and unique customs.",
          softWrap: true, //agar text ny dikebawahin kalau udah nyentuh layar
      ),
    );


    return MaterialApp(

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false, //untuk hilangi banner yg ad di contoh hp/device
      home: Scaffold(
        appBar: AppBar(
        title: const Text("Flutter layout"),
        ),
        body: OrientationBuilder(
          builder: (context, orientation) {
            return orientation == Orientation.portrait ?
            _buildVerticalLayout() : _builHorizontalLayout();
          },
        )

        ListView( //kalau pakai column gabisa di scroll cm 1 layar, kalau listview untuk bisa di scroll
            children: [
              Image.asset("images/danautoba.jpeg", width: 600, height: 240, fit: BoxFit.cover,),
              titleSection, buttonSection, textSection]
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8), //insets mirip kayak padding, jarak garis terluar, kalau didalam widget disebut insets, kalau row container column itu padding
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          )
      ],
    );
  }
}