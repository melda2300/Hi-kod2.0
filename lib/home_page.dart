import 'package:flutter/material.dart';
import 'package:hikod/auth_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final List<String> categories = [
    'Spor',
    'Ekonomi',
    'Politika',
    'Sağlık',
    'Teknoloji'
  ];

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Haberler'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => authService.logout(),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text(categories[index]),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NewsPage(category: categories[index])));
            },
          );
        },
      ),
    );
  }
}

class NewsPage extends StatelessWidget {
  final String category;

  NewsPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$category Haberleri'),
      ),
      body: Center(
        child: Text('Bu sayfada $category ile ilgili haberler gösterilecektir.'),
      ),
    );
  }
}
