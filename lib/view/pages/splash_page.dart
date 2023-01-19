import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamo/shared/theme.dart';

import '../../state_management/blocs/auth/auth_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          Timer(
            const Duration(seconds: 2),
            () {
              if (state is AuthSucces) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (route) => false);
              }

              if (state is AuthFailed) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/sign-in', (route) => false);
              }
            },
          );
          return Center(
            child: _buildSplashImage(),
          );
        },
      ),
    );
  }

  Widget _buildSplashImage() {
    return Container(
      width: 130,
      height: 150,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/splash.png'),
        ),
      ),
    );
  }
}
