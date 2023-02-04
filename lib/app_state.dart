import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random(maxSyllables: 40);
    notifyListeners();
  }

  List<WordPair> favorites = [];

  dynamic toggleFavorite(WordPair pair) {
    if (favorites.contains(pair)) {
      favorites.remove(pair);
    } else {
      favorites.add(pair);
    }

    notifyListeners();
  }
}
