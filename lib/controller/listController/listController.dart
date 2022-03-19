import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop1/data/list.dart';
import 'package:shop1/models/product.dart';

class ListController extends GetxController {
  List<Product> _list = productList;
  late ScrollController _scrollController;

 

   



//----------
  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }

  int get count {
    return _list.length;
  }

  List<Product> get ductList {
    return [..._list];
  }
}
