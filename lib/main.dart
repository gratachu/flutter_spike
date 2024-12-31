import 'package:flutter/material.dart';

// エントリーポイント
void main() {
  runApp(const SimpleTextApp());
}

class SimpleTextApp extends StatelessWidget {
  const SimpleTextApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Text Input/Output',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const TextPage(),
    );
  }
}

class TextPage extends StatefulWidget {
  const TextPage({Key? key}) : super(key: key);

  @override
  State<TextPage> createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  // 入力されたテキストを保持するcontroller
  final TextEditingController _controller = TextEditingController();

  // 表示敵をスト保持する変数
  String _displayText = '';

  // ボタン押下時の処理
  void _onSendButtonPressed() {
    setState(() {
      // controllerに入力されたテキストを取得し、表示テキストに設定
      _displayText = _controller.text;
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Text Input/Output'),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              TextField(
                  controller: _controller,
                  decoration:
                      const InputDecoration(hintText: 'Input your text here')),
              const SizedBox(height: 16),

              // 送信ボタン
              ElevatedButton(
                onPressed: _onSendButtonPressed,
                child: const Text('Send'),
              ),
              const SizedBox(height: 16),

              // 表示部分
              Text(
                _displayText,
                style: const TextStyle(fontSize: 20),
              )
            ],
          )),
    );
  }
}
