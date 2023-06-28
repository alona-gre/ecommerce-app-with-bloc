import 'dart:async';
import 'package:ecommerce_app/repositories/auth/auth_repository.dart';
import 'package:ecommerce_app/repositories/user/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;
  StreamSubscription<auth.User?>? _authUserSubscription;
  StreamSubscription<User?>? _userSubscription;

  AuthBloc({
    required AuthRepository authRepository,
    required UserRepository userRepository,
  })  : _authRepository = authRepository,
        _userRepository = userRepository,
        super(const AuthState.unknown()) {
    on<AuthUserChangedEvent>(_onAuthUserChanged);

    _authUserSubscription = _authRepository.user.listen((authUser) {
      print('Auth User: $authUser');
      if (authUser != null) {
        _userRepository.getUser(authUser.uid).listen((user) {
          add(AuthUserChangedEvent(
            authUser: authUser,
            user: user,
          ));
        });
      } else {
        add(AuthUserChangedEvent(authUser: authUser));
      }
    });
  }

  _onAuthUserChanged(
    AuthUserChangedEvent event,
    Emitter<AuthState> emit,
  ) {
    event.authUser != null
        ? emit(
            AuthState.authenticated(
              authUser: event.authUser!,
              user: event.user!,
            ),
          )
        : emit(
            const AuthState.unauthenticated(),
          );
  }

  @override
  Future<void> close() {
    _authUserSubscription?.cancel();
    _userSubscription?.cancel();
    return super.close();
  }
}
