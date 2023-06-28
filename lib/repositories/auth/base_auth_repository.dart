import 'package:firebase_auth/firebase_auth.dart' as auth;

abstract class BaseAuthRepository {
  Stream<auth.User?>
      get user; // we listen to the changes to the User object from FB auth
  Future<auth.User?> signUp({
    required String email,
    required String password,
  });
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> signOut();
}
