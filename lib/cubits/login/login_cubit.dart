import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/repositories/auth/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(LoginState.initial());

  void emailChanged(String value) {
    emit(
      state.copyWith(email: value, status: LoginStatus.initial),
    );
  }

  void passwordChanged(String value) {
    emit(
      state.copyWith(password: value, status: LoginStatus.initial),
    );
  }

  Future<void> loginWithCredentials() async {
    // if (!state.isFormValid) return;
    if (state.status == LoginStatus.submitting) return;
    emit(state.copyWith(status: LoginStatus.submitting));

    try {
      await _authRepository.logInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );
      emit(
        state.copyWith(status: LoginStatus.success),
      );
    } catch (_) {}
  }
}
