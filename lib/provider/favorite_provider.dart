import 'package:flutter/cupertino.dart';

class FavoriteItemProvider extends ChangeNotifier{
  final List<int> _selectedItem = [];
  List<int> get selectedItem => _selectedItem ;

  void addFovorite(int value){
    _selectedItem.add(value);
    notifyListeners();
  }

  void removeFavorite(int value){
    _selectedItem.remove(value);
    notifyListeners();
  }
}