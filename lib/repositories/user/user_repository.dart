// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ecommerce_app/models/user_model.dart';
import 'package:ecommerce_app/repositories/user/base_user_repository.dart';

class UserRepository extends BaseUserRepository {
  final FirebaseFirestore _firebaseFirestore;

  UserRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> createUser(User user) async {
    await _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .set(user.toDocument());
  }

  @override
  // we are returning a stream of User objects for a specific user id
  Stream<User> getUser(String userId) {
    print('Getting user Data from Cloud Firestore');
    return _firebaseFirestore
        .collection('users')
        .doc(userId)
        .snapshots()
        .map((snap) => User.fromSnapshot(snap));
  }

  @override
  Future<void> updateUser(User user) async {
    await _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .update(user.toDocument())
        .then(
          (value) => print('User document updated'),
        );
  }
}
