import 'package:flutter/material.dart';
import 'api_service.dart';  

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Quotes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RandomQuoteScreen(),
    );
  }
}

class RandomQuoteScreen extends StatefulWidget {
  @override
  _RandomQuoteScreenState createState() => _RandomQuoteScreenState();
}

class _RandomQuoteScreenState extends State<RandomQuoteScreen> {
  String _quote = 'Press the button to get a quote!';

  Future<void> _fetchQuote() async {
    final fetchedQuote = await ApiService.fetchRandomQuote();
    setState(() {
      _quote = fetchedQuote ?? 'Failed to load quote. Try again later.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Quote'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _quote,
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchQuote,
              child: Text('Fetch Quote'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchQuote,
        child: Icon(Icons.refresh),
        tooltip: 'Fetch a new quote',
      ),
    );
  }
}
