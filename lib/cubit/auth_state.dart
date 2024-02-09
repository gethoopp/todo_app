part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

// ignore: must_be_immutable
final class AuthSucces extends AuthState {
  User? user;

  AuthSucces(this.user);
}


// ignore: must_be_immutable
final class AuthErr extends AuthState {
  GetSnackBar snackbar;

  AuthErr(this.snackbar);
}
