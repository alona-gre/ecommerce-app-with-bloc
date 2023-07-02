part of 'auth_bloc.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthState extends Equatable {
  final AuthStatus status;
  final auth.User? authUser;
  final User? user;

  const AuthState._({
    this.status = AuthStatus.unknown,
    this.authUser,
    this.user,
  });

// if the state of the user is unknown, it should return a basic named constructor:
  const AuthState.unknown() : this._();

// if the state of the user is authenticated,
//  we're gonna pass these as input to the original constructor:
  const AuthState.authenticated({
    required auth.User authUser,
    //required User user,
  }) : this._(
          status: AuthStatus.authenticated,
          authUser: authUser,
          // user: user,
        );

// if the state of the user is unauthenticated, it should return a basic named constructor:
  const AuthState.unauthenticated()
      : this._(
          status: AuthStatus.unauthenticated,
        );

  @override
  List<Object?> get props => [status, authUser, user];
}
