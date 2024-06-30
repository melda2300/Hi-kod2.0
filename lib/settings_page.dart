import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late TextEditingController _radiusController; // Bildirim mesafesi kontrolcüsü

  @override
  void initState() {
    super.initState();
    _radiusController = TextEditingController(); // Kontrolcüyü başlat
    _loadRadius(); // Bildirim mesafesini yükle
  }

  void _loadRadius() async {
    SharedPreferences prefs = await SharedPreferences.getInstance(); // Paylaşılan ayarları al
    setState(() {
      _radiusController.text = (prefs.getInt('radius') ?? 50).toString(); // Mesafeyi ayarla
    });
  }

  void _saveRadius() async {
    SharedPreferences prefs = await SharedPreferences.getInstance(); // Paylaşılan ayarları al
    prefs.setInt('radius', int.parse(_radiusController.text)); // Mesafeyi kaydet
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'), // Ayarlar sayfası başlığı
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _radiusController, // Mesafe kontrolcüsünü bağla
              decoration: const InputDecoration(labelText: 'Alert Radius (km)'), // Mesafe için ipucu metin
              keyboardType: TextInputType.number, // Sayısal giriş
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _saveRadius(); // Mesafeyi kaydet
                Navigator.pop(context); // Ayarlar sayfasından çık
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
