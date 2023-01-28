part of 'token_cubit.dart';

@immutable
abstract class TokenState {}

class TokenInitial extends TokenState {}

class gotToken extends TokenState {
  final token;

  gotToken(
    this.token,
  );
}
