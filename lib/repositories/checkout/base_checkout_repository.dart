import '../../models/checkout_model.dart';

abstract class BaseCheckoutRepository {
  // it will take a Checkout object, and save it to Firestore
  Future<void> addCheckout(Checkout checkout);
}
