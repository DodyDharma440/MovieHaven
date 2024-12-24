import 'package:flutter/material.dart';
import 'package:movie_haven/app/shared/controllers/auth_state.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _authState = AuthState.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(_authState.userData?.email ?? ""),
    );
  }
}
