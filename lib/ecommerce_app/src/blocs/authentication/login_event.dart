part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}
class RequestGoogleLogin extends LoginEvent {}
class RequestTwitterLogin extends LoginEvent {}
class RequestFacebookLogin extends LoginEvent {}