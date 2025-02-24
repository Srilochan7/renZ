part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
}

final class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;

  const AuthLoginRequested(this.email, this.password);
}

final class AuthSigninRequested extends AuthEvent {
  final String email;
  final String password;

  const AuthSigninRequested(this.email, this.password);
}

final class AuthLogoutRequested extends AuthEvent {}

final class AuthCheckStatus extends AuthEvent {}  // New event for auth state check
