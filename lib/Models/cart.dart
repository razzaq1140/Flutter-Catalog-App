import 'package:catalog_app/Models/catalog.dart';
import 'package:catalog_app/core/store.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel{

  // static final cartModel = CartModel._internal();
  // CartModel._internal();
  // factory CartModel() => cartModel;

  late CatalogModel _catalog;
  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog){
    _catalog = newCatalog;
  }

  List<Item> get items => _itemIds.map((id)  => _catalog.getbyId(id)).toList();

  //Get total price
  num get totalPrice => items.fold(0, (total, current) => total + current.price);

  //Add Item
  // void add(Item item){
  //   _itemIds.add(item.id);
  // }

  //Remove Item
  // void remove(Item item){
  //   _itemIds.remove(item.id);
  // }

}

class AddMutation extends VxMutation<MyStore>{
  final Item item;
  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }

}

class RemoveMutation extends VxMutation<MyStore>{
  final Item item;
  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }

}