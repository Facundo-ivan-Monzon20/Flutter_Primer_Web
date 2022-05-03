import 'package:english_words/english_words.dart'; // Add this line.
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Startup Name Generator'),
          leading: const Icon(Icons.fingerprint),
          backgroundColor: Colors.indigo,
        ),
        body: ListView(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Card(child: Image.network('images/medusa.png')),
              Text(
                'Texto del body',
                style: TextStyle(fontSize: 30),
              ),
              Center(child: Icon(Icons.app_registration, size: 50)),
            ]),
        // Const Center(
        // child: RandomWords())
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[]; // NEW
  final _biggerFont = const TextStyle(fontSize: 18); // NEW

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return const Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return ListTile(
          title: Text(
            _suggestions[index].asPascalCase,
            style: _biggerFont,
          ),
        );
      },
    );
    //final wordPair = WordPair.random(); // NEW
    //return Text(wordPair.asPascalCase); // NEW
  }
}
