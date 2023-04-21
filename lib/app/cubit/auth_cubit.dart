import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState(AuthStatus.initial));

  Future<void> logIn() async {
    emit(
      const AuthState(AuthStatus.authenticating),
    );

    await Future<void>.delayed(const Duration(seconds: 5));

    emit(
      const AuthState(AuthStatus.authenticated),
    );
  }

  void logOut() => emit(
        const AuthState(AuthStatus.unauthenticated),
      );
}
