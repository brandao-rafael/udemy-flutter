import 'package:flutter/material.dart';
import 'package:my_locations/model/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Place itemByIndex (int index) {
    return _items[index];
  }
}