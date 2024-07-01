import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hikod/home_page.dart'; // HomePage widget'ı import edildiğinden emin olun

void main() {
  testWidgets('HomePage initial state test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: HomePage(), // Test edilecek widget'ı belirtin
    ));

    // Verify that initial widgets are present.
    expect(find.text('Haberler'), findsOneWidget); // Uygulama başlığı kontrolü
    expect(find.byIcon(Icons.logout), findsNothing); // Çıkış yap icon'unun olmadığını kontrol edin
    expect(find.text('Giriş Yap'), findsOneWidget); // Giriş yap butonunun varlığını kontrol edin
  });

  testWidgets('HomePage after login test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: HomePage(), // Test edilecek widget'ı belirtin
    ));


    // Eğer AuthService mocklanmış veya test için ayarlanmışsa, giriş işlemini simüle edin
    // Örneğin, auth servisi üzerinden giriş işlemini simüle edebilirsiniz.

    // Yapılacak olan bir giriş işlemi, haberlerin görüntülenmesini sağlayacaktır.
    // Örneğin AuthService kullanımı ve giriş sonrası sayfanın yeniden oluşturulması
  });
}
