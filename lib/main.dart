import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'layouts/main_layout.dart';

void main() => runApp(HomePage());

class HomePageState with ChangeNotifier {
  bool isFavorited = true;
  int favoriteCount = 41;

  void toggleFavorite() {
    if (isFavorited) {
      favoriteCount -= 1;
      isFavorited = false;
    } else {
      favoriteCount += 1;
      isFavorited = true;
    }
    notifyListeners();
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildButtonColumn(color, Icons.call, 'CALL'),
        buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    return ChangeNotifierProvider(
      create: (context) => HomePageState(),
      child: MaterialApp(
        title: 'Flutter Layout Demo',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Layout Demo')
          ),
          body: ListView(
            children: [
              avatarSection,
              headerSection,
              buttonSection,
              textSection
            ],
          ),
        ),
      ),
    );
  }
}