import 'package:flutter/material.dart';
import 'package:spotify_desing_example/screens/spotifty_search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spotify Desing Demo',
      theme: ThemeData.dark(),
      home: const SpotiftySearchScreen(),
    );
  }
}
