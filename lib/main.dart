import 'package:flutter/material.dart';

void main() {
  runApp(const SimpleChat());
}

class SimpleChat extends StatelessWidget {
  const SimpleChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Chat',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // 入力されたテキストを保持するコントローラ
  final TextEditingController _controller = TextEditingController();

  // 複数のメッセージを管理するため、Listを用意
  final List<String> _messages = [];

  // 送信ボタン押下時の処理
  void _onSendButtonPressed() {
    final text = _controller.text.trim();
    if (text.isEmpty) return; // 空の入力はスルー

    setState(() {
      // 新しいメッセージをリストに追加
      _messages.add(text);
    });

    // 送信後は入力欄をクリア
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBarにタイトルを表示
      appBar: AppBar(
        title: const Text('メッセージ風デザイン'),
      ),
      // Columnの上に「メッセージ表示部分」、下に「入力部分」  
      body: Column(
        children: [
          // 1. メッセージ一覧
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return _buildMessageBubble(message);
              },
            ),
          ),

          // 2. 入力欄 + 送信ボタン
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                // テキストフィールド
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'メッセージを入力...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                // 送信ボタン
                IconButton(
                  onPressed: _onSendButtonPressed,
                  icon: const Icon(Icons.send),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 吹き出し(バブル)部分をWidgetに分離
  Widget _buildMessageBubble(String message) {
    return Align(
      // 今はすべて右寄せ。送信者・受信者で左右分けたければ条件分岐などを活用
      alignment: Alignment.centerRight,
      child: Container(
        // マージンやパディングを調整して吹き出しっぽく
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(message),
      ),
    );
  }
}
