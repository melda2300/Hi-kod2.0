class AppUser {
  final String uid;
  final String email;
  final String? displayName;
  final String? photoUrl;

  AppUser({
    required this.uid,
    required this.email,
    this.displayName,
    this.photoUrl,
  });

  // Firebase User'ı AppUser'a dönüştürmek için bir yöntem
  factory AppUser.fromFirebaseUser(AppUser user) {
    return AppUser(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
      photoUrl: user.photoUrl,
    );
  }
}