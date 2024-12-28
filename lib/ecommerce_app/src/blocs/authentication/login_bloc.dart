import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../data/repository/repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository repository;
  LoginBloc(this.repository) : super(LoginInitial()) {

    on<RequestGoogleLogin>((event, emit) async{
      try{
        emit(LoginLoading());
        final User? user=await repository.signInWithGoogle();
        debugPrint("User: ${user?.displayName}");
        emit(LoginSuccess());
      }catch(error){
        debugPrint(error.toString());
        emit(LoginFailed(error.toString()));
      }
    });
    on<RequestFacebookLogin>((event, emit) async{
      try{
        emit(LoginLoading());
        final User? user=await repository.signInWithFacebook();
        debugPrint("User: ${user?.displayName}");
        emit(LoginSuccess());
      }catch(error){
        debugPrint(error.toString());
        emit(LoginFailed(error.toString()));
      }
    });

    on<RequestTwitterLogin>((event, emit) async{
      try{
        emit(LoginLoading());
        final user=await repository.signInWithTweeter();
        debugPrint("User: ${user?.displayName}");
        emit(LoginSuccess());
      }catch(error){
        debugPrint(error.toString());
        emit(LoginFailed(error.toString()));
      }
    });

  }
}
