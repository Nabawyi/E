import 'package:ecommerceapp/models/shoe.dart';
import 'package:ecommerceapp/models/shoelist.dart';
import 'package:flutter/cupertino.dart';

class Cart extends ChangeNotifier {
  List<Shoe> usercart = [];

  List<Shoe> getShoelist() {
    return ShoesListClass().shoeslist1;
  }

  List<Shoe> getusercart() {
    return usercart;
  }

  void additemtothecart(Shoe shoe) {
    usercart.add(shoe);
    notifyListeners();
  }

  void removeitemfromcart(Shoe shoe) {
    usercart.remove(shoe);
    notifyListeners();
  }
}
