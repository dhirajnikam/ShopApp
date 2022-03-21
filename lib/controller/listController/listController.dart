import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shop1/data/list.dart';
import 'package:shop1/models/product.dart';
import 'package:shop1/services/database.dart';

class ListController extends GetxController {
  // final List<Product> _list = productList;
  RxList<Product> listProduct = RxList<Product>([]);
  //List<Product>? get proList => _list.value;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    listProduct.bindStream(FireStoreDB().getProduct());
  }

  // Stream<List<Product>> getProduct() =>  firebaseFirestore
  //     .collection('ListShop')
  //     .snapshots()
  //     .map((event) => event.docs.map((e) => Product.fromMap(e)).toList());
}
