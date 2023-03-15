import 'package:filmes_app/presenter/login_presenter.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final LoginPresenter presenter;
  const LoginPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    presenter.isLogin(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: presenter.signInWithGoogle,
          child: const Text('Login Google'),
        ),
      ),
    );
  }
}
