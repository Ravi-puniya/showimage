import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:showimage/Screens/favourite_screen.dart';
import 'package:showimage/Widget/common_widget.dart';
import 'package:http/http.dart' as http;

import '../provider/favourite_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  // void initState() {
  //   super.initState();
  //   getData();
  // }

  bool _issearch = false;
  bool _isloading = true;
  List images = [];

  getData() async {
    final data = await http.get(Uri.parse(
        'https://api.unsplash.com/photos/?client_id=5iDHfxxV5wkluodmqkLs2caOr7iyridsi210jhEVurg'));

    images = jsonDecode(data.body);
    setState(() {
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provideItem = Provider.of<favourite>(context);
    getData();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Color.fromARGB(66, 179, 171, 171),
        appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _issearch = !_issearch;
                  });
                },
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => FavouriteImage(),
                  ));
                },
                icon: Icon(Icons.favorite),
              ),
            ],
            elevation: 0,
            title: const Text(
              'Pictures',
              style: TextStyle(
                  letterSpacing: 2,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            backgroundColor: Colors.transparent),
        body: _isloading
            ? const Center(child: CircularProgressIndicator())
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 4 / 6),
                itemCount: images.length,
                itemBuilder: (context, index) => Consumer(
                  builder: (context, value, child) => GirdImage(
                    value: index,
                    image: images[index]['urls']['regular'],
                  ),
                ),
              ),
      ),
    );
  }
}
