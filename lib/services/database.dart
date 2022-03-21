import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop1/models/product.dart';

class FireStoreDB {
  // FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final userRef = FirebaseFirestore.instance.collection('ListShop');

    Stream<List<Product>> getProduct() =>  userRef
      .snapshots()
      .map((event) => event.docs.map((e) => Product.fromMap(e)).toList());
  
}
