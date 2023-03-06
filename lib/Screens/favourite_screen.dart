import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:showimage/provider/favourite_item.dart';

class FavouriteImage extends StatefulWidget {
  const FavouriteImage({super.key});

  @override
  State<FavouriteImage> createState() => _FavouriteImageState();
}

class _FavouriteImageState extends State<FavouriteImage> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<favourite>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title:const Text('Favourites'),
          elevation: 0,
        ),
        backgroundColor:const Color.fromARGB(66, 179, 171, 171),
        body: GridView.builder(
            itemCount: data.favouriteItem.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 4 / 6),
            itemBuilder: (context, index) {
              return
                  // Text('data:${data.favouriteItem.length}');
                  GridTile(
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 3, right: 5, left: 5, bottom: 2),
                  //height: 100,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all()),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      data.favouriteItem[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }));
  }
}
