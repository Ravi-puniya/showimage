import 'package:flutter/foundation.dart';

class favourite extends ChangeNotifier {
  List _favouriteItem = [];

  List get favouriteItem => _favouriteItem;

  void addItem(value) {
    _favouriteItem.add(value);
  }

  void removeItem(value) {
    _favouriteItem.remove(value);
  }
}
