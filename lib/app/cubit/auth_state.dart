part of 'auth_cubit.dart';

enum AuthStatus {
  initial,
  authenticating,
  authenticated,
  unauthenticated;
}

class AuthState extends Equatable {
  const AuthState(this.status);

  final AuthStatus status;

  @override
  List<Object?> get props => [status];
}
