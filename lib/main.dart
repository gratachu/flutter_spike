import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Count Up/Down App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CountPage(),
    );
  }
}

class CountPage extends StatefulWidget {
  const CountPage({super.key});

  @override
  State<CountPage> createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {
  int _counter = 0;

  // カウントアップ
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // カウントダウン
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  // リセット（任意で実装）
  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('カウントアップ・ダウン'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '現在のカウント: $_counter',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _counter >= 1 ? _decrementCounter : null,
                  
                  child: const Text('－'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: const Text('＋'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _counter == 0 ? null : _resetCounter,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('リセット'),
            ),
          ],
        ),
      ),
    );
  }
}
