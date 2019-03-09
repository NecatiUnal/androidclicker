import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return initializeHomescreen(context);
  }

  MaterialApp initializeHomescreen(BuildContext c) {
    return MaterialApp(
      title: 'My first flutter application',
      theme: Theme.of(c).copyWith(
        brightness: Brightness.dark,
        bottomAppBarColor: Colors.red,
        primaryColor: Colors.yellow,
        canvasColor: Color.fromRGBO(230, 230, 230, 0.8),
        textTheme: new TextTheme(
          body1: new TextStyle( 
            color: Colors.green,
            fontFamily: "LatoLight",
            fontSize: 30,
          )
        )
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Welcome to Flutter."),
        ),
        body: Center(
          child: RandomWords(),
        ),
      ),
    );
  }

  void initTheme(BuildContext c){
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
          style: Theme.of(context).textTheme.body1,
      )
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}
