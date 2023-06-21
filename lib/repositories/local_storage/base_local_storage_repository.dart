import 'package:hive/hive.dart';

import '../../models/product_model.dart';

abstract class BaseLocalRepository {
  Future<Box> openBox(); // opens Hive Box
  List<Product> getWishlist(Box box); // retrives all the products in Wishlist
  Future<void> addProductToWishlist(Box box, Product product);
  Future<void> removeProductFromWishlist(Box box, Product product);
  Future<void> clearWishlist(Box box);
}
