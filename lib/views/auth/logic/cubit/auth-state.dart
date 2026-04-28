import 'package:flutter/material.dart';

@immutable
sealed class AuthenState{}

class   AuthInitialState extends AuthenState{}

class LoginSuccses extends AuthenState{}
class LoginLoading extends AuthenState{

}
class LoginError extends AuthenState{
  final String message;

  LoginError( this.message);

}

class  SignUpSuccses extends AuthenState{}
class SignUpLoading extends AuthenState{}
class SignUpError extends AuthenState{
  final String message;

  SignUpError( this.message);

}

final class GoogleSignInSuccses extends AuthenState{}
final class GoogleSignInLoading extends AuthenState{}
final class GoogleSignInError extends AuthenState{
  final String error;

  GoogleSignInError({required this.error});
}

final class LogOutSuccses extends AuthenState{}
final class LogOutLoading extends AuthenState{}
final class LogOutError extends AuthenState{
  final String error;

  LogOutError({required this.error});
}
final class ResetPassSuccses extends AuthenState{}
final class ResetPassLoading extends AuthenState{}
final class ResetPassError extends AuthenState{
  final String error;

  ResetPassError({required this.error});
}

final class UserDataAddSuccses extends AuthenState{}
final class UserDataAddLoading extends AuthenState{}
final class UserDataAddError extends AuthenState{
  final String error;

  UserDataAddError({required this.error});
}

final class GetDataSuccses extends AuthenState{}
final class GetDataLoading extends AuthenState{}
final class GetDataError extends AuthenState{
  final String error;

  GetDataError({required this.error});
}


