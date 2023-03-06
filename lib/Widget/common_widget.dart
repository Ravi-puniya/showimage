import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favourite_item.dart';

class GirdImage extends StatefulWidget {
  String image;
  var value;

  GirdImage({
    super.key,
    required this.image,
    required this.value,
  });

  @override
  State<GirdImage> createState() => _GirdImageState();
}

class _GirdImageState extends State<GirdImage> {
  @override
  bool _isSave = false;

  @override
  Widget build(BuildContext context) {
    final provideItem = Provider.of<favourite>(context);

    return Stack(
      fit: StackFit.expand,
      children: [
        GridTile(
          child: Container(
            margin: const EdgeInsets.only(top: 3, right: 5, left: 5, bottom: 2),
            //height: 100,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), border: Border.all()),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 7,
          right: 15,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isSave = !_isSave;
              });
              if (_isSave == true) {
                provideItem.addItem(widget.image);
              } else {
                provideItem.removeItem(widget.image);
              }
            },
            child: Icon(
              _isSave ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
              color: Colors.red,
            ),
          ),
          // IconButton(
          //   icon: Icon(CupertinoIcons.heart),
          //   onPressed: () {},
          // ),
        )
      ],
    );
  }
}
