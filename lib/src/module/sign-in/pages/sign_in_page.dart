import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:strava_clone/src/network/repositories/authentication_repo.dart';
import '../sign_in.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider(
          create: (_) => SignInCubit(context.read<AuthenticationRepository>()),
          child: const SignInForm(),
        ),
      ),
    );
  }
}
