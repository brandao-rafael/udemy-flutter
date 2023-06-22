// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

// ignore: constant_identifier_names
enum AuthMode { Signup, Login }

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _passwordController = TextEditingController();
  final AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  void _submit() {

  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 320,
        width: deviceSize.width * 0.75,
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: '  E-mail'),
                keyboardType: TextInputType.emailAddress,
                onSaved: (email) => _authData['email'] = email ?? '',
                validator: (_email) {
                  final email = _email ?? '';
                  if(email.trim().isEmpty || !email.contains('@')) {
                    return 'Informe um email válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: '  Senha'),
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                onSaved: (password) => _authData['email'] = password ?? '',
                validator: _authMode == AuthMode.Login ? null : (_password) {
                  final password = _password ?? '';
                  if (password.isEmpty || password.length < 5) {
                    return 'Informe uma senha válida';
                  }
                  return null;
                },
              ),
              if (_authMode == AuthMode.Signup)
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: '  Confirme sua Senha'),
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  validator: (_password) {
                    final password = _password ?? '';
                    if(password != _passwordController.text) {
                      return 'Senhas informadas não conferem.';
                    }
                    return null;

                  } ,
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30 ,
                    vertical: 8,
                  )
                ),
                child: Text(
                  _authMode == AuthMode.Login ? 'ENTRAR' : 'REGISTRAR',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
