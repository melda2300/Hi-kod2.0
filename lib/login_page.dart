import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController(); // Email kontrolcüsü
  final TextEditingController _passwordController = TextEditingController(); // Şifre kontrolcüsü

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('giriş')), // Uygulama çubuğu başlığı
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController, // Email kontrolcüsünü bağla
              decoration: const InputDecoration(labelText: 'Email'), // Email için ipucu metin
            ),
            TextField(
              controller: _passwordController, // Şifre kontrolcüsünü bağla
              decoration: const InputDecoration(labelText: 'şifre'), // Şifre için ipucu metin
              obscureText: true, // Şifreyi gizle
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final email = _emailController.text; // Girilen email
                final password = _passwordController.text; // Girilen şifre
                context.read<AuthService>().signIn(email, password); // Giriş yap
              },
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                final email = _emailController.text; // Girilen email
                final password = _passwordController.text; // Girilen şifre
                context.read<AuthService>().register(email, password); // Kayıt ol
              },
              child: const Text('Kayıt olmak'),
            ),
          ],
        ),
      ),
    );
  }
}
