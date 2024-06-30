import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hikod/auth_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
      ],
      child: MaterialApp(
        home: DogalAfetlerPage(),
      ),
    );
  }
}

class DogalAfetlerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Doğal Afetler'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Doğal Afetler Sayfasına Hoş Geldiniz!'),
            ElevatedButton(
              onPressed: () async {
                await authService.signOut();
              },
              child: Text('Çıkış Yap'),
            ),
          ],
        ),
      ),
    );
  }
}
