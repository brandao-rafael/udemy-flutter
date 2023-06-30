// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:chat/models/auth_form_data.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _formData = AuthFormData();

  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if(!isValid) return;
    
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                if (_formData.isSignup)
                  TextFormField(
                    key: const ValueKey('name'),
                    initialValue: _formData.name,
                    onChanged: (name) => _formData.name = name,
                    decoration: const InputDecoration(labelText: ' Nome'),
                    validator: (_name) {
                      final name = _name ?? '';
                      if (name.trim().length < 5) {
                        return 'Nome precisa ter pelo menos 5 letras';
                      }
                      return null;
                    },
                  ),
                TextFormField(
                  key: const ValueKey('email'),
                  initialValue: _formData.email,
                  onChanged: (email) => _formData.email = email,
                  decoration: const InputDecoration(labelText: ' E-mail'),
                  validator: (_email) {
                    final email = _email ?? '';
                    if (!email.contains('@')) {
                      return 'Email inválido';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  key: const ValueKey('password'),
                  initialValue: _formData.password,
                  onChanged: (password) => _formData.password = password,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: ' Senha'),
                  validator: (_password) {
                    final password = _password ?? '';
                    if (password.length < 6) {
                      return 'Senha precisa ter pelo menos 6 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: _submit,
                  child: Text(_formData.isLogin ? 'Entrar' : 'Registrar'),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _formData.toogleAuthMode();
                    });
                  },
                  child: Text(
                    _formData.isLogin
                        ? 'Criar uma nova conta?'
                        : 'Já possui conta?',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}