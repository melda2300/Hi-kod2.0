import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class AlertsPage extends StatefulWidget {
  const AlertsPage({super.key});

  @override
  _AlertsPageState createState() => _AlertsPageState();
}

class _AlertsPageState extends State<AlertsPage> {
  Position? _currentPosition; // Kullanıcının mevcut konumu

  @override
  void initState() {
    super.initState();
    _getCurrentLocation(); // Konumu al
  }

  void _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high, // Yüksek doğrulukta konum al
    );
    setState(() {
      _currentPosition = position; // Konumu ayarla
    });
  }

  @override
  Widget build(BuildContext context) {
    var FirebaseFirestore;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alerts'), // Uyarılar sayfası başlığı
      ),
      body: _currentPosition == null
          ? const Center(child: CircularProgressIndicator()) // Konum yükleniyorsa göster
          : StreamBuilder(
        stream: FirebaseFirestore.instance.collection('alerts').snapshots(), // Firestore'dan uyarıları dinle
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator()); // Veri yoksa göster
          }
          var filteredDocs = snapshot.data!.docs.where((doc) {
            double distance = Geolocator.distanceBetween(
              _currentPosition!.latitude, // Mevcut konumun enlemi
              _currentPosition!.longitude, // Mevcut konumun boylamı
              doc['latitude'], // Uyarının enlemi
              doc['longitude'], // Uyarının boylamı
            );
            return distance < 50000; // 50 km içinde olup olmadığını kontrol et
          }).toList();
          return ListView(
              children: filteredDocs.map((doc) {
                return ListTile(
                  title: Text(doc['title']), // Uyarı başlığı
                  subtitle: Text(doc['description']), // Uyarı açıklaması
                );
              }).toList()
          );
        },
      ),
    );
  }
}

class QuerySnapshot {
  get docs => null;
}