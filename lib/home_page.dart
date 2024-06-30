import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_service.dart';
import 'alerts_page.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'), // Ana sayfa başlığı
        actions: [
          IconButton(
            icon: const Icon(Icons.settings), // Ayarlar ikonu
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()), // Ayarlar sayfasına git
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout), // Çıkış ikonu
            onPressed: () {
              context.read<AuthService>().signOut(); // Çıkış yap
            },
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AlertsPage()), // Uyarılar sayfasına git
            );
          },
          child: const Text('View Alerts'),
        ),
      ),
    );
  }
}

