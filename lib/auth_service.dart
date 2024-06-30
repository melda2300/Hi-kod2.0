import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'user.dart'; // Yeni oluşturduğumuz user.dart dosyasını içe aktar

class AuthService extends ChangeNotifier {
  final authService = Provider.of<AuthService>(context!);

  static BuildContext? get context => null; // Firebase Authentication örneği
  var _auth;
  Future<AppUser?> _userFromFirebase(User? user) async {
    return user != null
        ? AppUser.fromFirebaseUser(user as AppUser)
        : null; // Firebase User'ı AppUser'a dönüştür
  }

  Future<dynamic> get currentUser async => _auth.currentUser; // Mevcut kullanıcıyı al

  Stream<AppUser?> get user {
    return _auth.authStateChanges().map(
        _userFromFirebase as AppUser? Function(User? event)); // Kullanıcı durumundaki değişiklikleri dinle ve AppUser'a dönüştür
  }

  Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email, password: password); // Kullanıcıyı giriş yap
    } catch (e) {
      print(e.toString()); // Hata varsa yazdır
    }
  }

  Future<void> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password); // Yeni kullanıcı oluştur
    } catch (e) {
      print(e.toString()); // Hata varsa yazdır
    }
  }

  Future<void> signOut() async {
    await _auth.signOut(); // Kullanıcıyı çıkış yap
  }
}
