import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:local_auth/local_auth.dart';

part 'auth_state.dart';
part 'auth_event.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _localAuth = LocalAuthentication();

  _init() {
    add(AuthenticatePressed());
  }

  AuthBloc() : super(const AuthState()) {
    on<AuthenticatePressed>((event, emit) async {
      final result = await _localAuth.authenticate(
        localizedReason:
            'We need permissions to use your biometrics to provide you access to the application',
        options: const AuthenticationOptions(),
      );
      if (result) {
        // TODO Open tasks
      } else {
        Fluttertoast.showToast(
          msg: "Authenticate in the application to get access to its data",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 14.0,
        );
      }
    });

    _init();
  }
}
