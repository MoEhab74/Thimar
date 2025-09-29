class LoginState {}

class LoadingLoginState extends LoginState {}

class SuccessLoginState extends LoginState {
  final String message;
  SuccessLoginState(this.message);
}
class ErrorLoginState extends LoginState {
  final String message;
  ErrorLoginState(this.message);
}