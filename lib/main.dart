import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hikod/auth_service.dart';
import 'package:hikod/egister_page.dart';
import 'package:hikod/firebase_options.dart';
import 'package:hikod/home_page.dart';
import 'package:hikod/login_page.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthService(),
      child: MaterialApp(
        title: 'Haber Uygulaması',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}
